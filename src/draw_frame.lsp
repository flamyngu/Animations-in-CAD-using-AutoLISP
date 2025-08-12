(defun str-trim (str / start end)
  ;; Führende und folgende Leerzeichen entfernen
  (setq start 1)
  (while (and (<= start (strlen str))
              (= (substr str start 1) " "))
    (setq start (1+ start))
  )
  (setq end (strlen str))
  (while (and (>= end start)
              (= (substr str end 1) " "))
    (setq end (1- end))
  )
  (if (> end (1- start))
    (substr str start (- end start -1))
    ""
  )
)

(defun str-split (str delim / pos result part len delim-len)
  ;; Einfacher Split: trennt str bei delim (ein Zeichen)
  (setq delim-len (strlen delim))
  (setq result '())
  (setq len (strlen str))
  (setq pos 1)
  (while (<= pos len)
    (setq part "")
    (while (and (<= pos len) (not (= (substr str pos delim-len) delim)))
      (setq part (strcat part (substr str pos 1)))
      (setq pos (1+ pos))
    )
    (setq result (append result (list part)))
    (setq pos (+ pos delim-len))
  )
  result
)

(defun parse-pbm-line (line / trimmed split nums)
  (setq trimmed (str-trim line))
  ;; Spalte anhand von Leerzeichen splitten
  (setq split (str-split trimmed " "))
  ;; Strings zu Zahlen konvertieren
  (setq nums '())
  (foreach s split
    (if (not (equal s ""))
      (setq nums (append nums (list (atoi s))))
    )
  )
  nums
)

(defun draw-rect-horizontal-line (row start-col end-col scale / y x1 x2)
  (setq y (* (- row) scale))
  (setq x1 (* start-col scale))
  (setq x2 (+ (* (1+ end-col) scale) 0))
  (entmake
    (list
      '(0 . "LWPOLYLINE")
      '(100 . "AcDbEntity")
      '(100 . "AcDbPolyline")
      '(90 . 4) ;; 4 Punkte
      '(70 . 1) ;; geschlossen
      (cons 10 (list x1 y))
      (cons 10 (list x2 y))
      (cons 10 (list x2 (- y scale)))
      (cons 10 (list x1 (- y scale)))
    )
  )
)


(defun draw-horizontal-line (row start-col end-col scale / p1 p2 y x1 x2)
  (setq y (* (- row) scale))
  (setq x1 (* start-col scale))
  (setq x2 (+ (* (1+ end-col) scale) 0))
  (setq p1 (list x1 y 0))
  (setq p2 (list x2 y 0))
  (command "_.LINE" p1 p2 "")
)

(defun draw-line-segments-in-row (row data scale / col start in-segment)
  (setq col 0
        in-segment nil)
  (while (< col (length data))
    (if (= (nth col data) 1)
      (if (not in-segment)
        (progn
          (setq in-segment t)
          (setq start col)
        )
      )
      (if in-segment
        (progn
          (draw-rect-horizontal-line row start (1- col) scale)
          (setq in-segment nil)
        )
      )
    )
    (setq col (1+ col))
  )
  (if in-segment
    (draw-rect-horizontal-line row start (1- col) scale)
  )
)

(defun draw-frame (filename / file line row data scale)
  (setq scale 20) ;; Pixelgröße anpassen

  (setq file (open filename "r"))
  ;; PBM Header lesen (2 Zeilen: P1 und Größe oder Kommentar)
  (read-line file)
  (read-line file)

  (setq row 0)
  (while (setq line (read-line file))
    (if (and (> (strlen (str-trim line)) 0)
             (/= (substr line 1 1) "#"))
      (progn
        (setq data (parse-pbm-line line))
        (draw-line-segments-in-row row data scale)
        (setq row (1+ row))
      )
    )
  )
  (close file)
  (princ "\nFertig gezeichnet.")
)

(defun c:drawpbm ()
  (princ "\nBefehl drawpbm gestartet")
  (setq filename (getfiled "PBM-Datei wählen" "" "pbm" 0))
  (if filename
    (draw-frame filename)
    (princ "\nKeine Datei gewählt.")
  )
  (princ)
)

(defun c:testcmd ()
  (princ "\nTestbefehl ausgeführt.")
  (command "RECTANGLE" "0,0" "5,5")
  (princ)
)

(defun load-frames-list-from-txt (filepath / frames f line)
  (setq frames '())
  (setq f (open filepath "r"))
  (if (not f)
    (progn (princ (strcat "\nDatei nicht gefunden: " filepath)) nil)
    (progn
      (while (setq line (read-line f))
        (if (/= line "") ; leere Zeilen ignorieren
          (setq frames (append frames (list line)))
        )
      )
      (close f)
      frames
    )
  )
)

(defun play-frames-from-list (frames / i selset)
  (if (not frames)
    (princ "\nKeine Frames zum Abspielen vorhanden.")
    (progn
      (command "_.MSPACE") ;; In Modelspace wechseln
      (setq i 0)
      (while (< i (length frames))
        ;; Alles löschen
        (setq selset (ssget "X"))
        (if selset (command "_.ERASE" selset ""))
        
        ;; Frame zeichnen
        (draw-frame (nth i frames))
        
        ;; Zoom Extents
        (command "_.ZOOM" "_EXTENTS")
        
        ;; Kleine Pause
        (vl-sleep 0.1)
        
        (setq i (1+ i))
      )
      (princ "\nAlle Frames gezeichnet.")
    )
  )
  (princ)
)

(defun c:playframes (/ filepath frames)
  (princ "\nBitte Textdatei mit Frame-Pfaden auswählen:")
  (setq filepath (getfiled "Textdatei mit Frame-Pfaden wählen" "" "txt" 0))
  (if (not filepath)
    (princ "\nKeine Datei ausgewählt. Abbruch.")
    (progn
      (setq frames (load-frames-list-from-txt filepath))
      (play-frames-from-list frames)
    )
  )
  (princ)
)


