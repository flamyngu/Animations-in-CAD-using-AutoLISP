(defun c:BMPPLAY(/ doc ms folder scale files imgobj fps delay total frame start-time)
	(vl-load-com)
	(setq doc (vla-get-ActiveDocument (vlax-get-acad-object)))
	(setq ms (vla-get-ModelSpace doc))
    (setq folder (getstring "\nEnter folder path containing BMP frames: "))
    (if (not (vl-file-directory-p folder))
        (progn
            (princ "\nInvalid folder path.")
            (exit)
        )
    
    )
	(setq scale (getreal "\nEnter scale factor (e.g. 1.0 for 100%): "))
	(if (not scale) (setq scale 1.0))
    (setq fps (getint "\nEnter target FPS (0 for max): "))
	(if (not fps) (setq fps 0))
	(if (> fps 0) (setq delay (/ 1000 fps)))
	(setq files
    	(vl-sort
        	(vl-directory-files folder "*.bmp" 1)
        	'<
        )
    )
 	(setq total (length files))
  	(if (= total 0)
   	   (progn
    	  (princ "\nNo BMP files found.")
          (exit)
       )
    )
    (setq imgobj
           (vla-AddRaster ms 
                         (strcat folder "\\" (car files))
                         (vlax-3d-point '(0 0 0))
                         scale
                         0.0
           )
    )
    ; Zoom to show the image
    (command "_.ZOOM" "_W" "-0.89, -0.36" "1.57, 0.84")
    (setvar "SELECTIONPREVIEW" 0)
    (princ (strcat "\nPlaying " (itoa total) " frames at " (itoa fps) " FPS..."))
    (princ "\nAnimation starting...")
    (setq frame 0)
	(while (< frame total)
    	(vla-put-ImageFile imgobj (strcat folder "\\" (nth frame files)))
    	(vla-Update imgobj)  ; Force screen update
		(if (> fps 0)
			(progn
				(setq start-time (getvar "MILLISECS"))
				(while (< (- (getvar "MILLISECS") start-time) delay))
			)
			(progn
				(setq start-time (getvar "MILLISECS"))
				(while (< (- (getvar "MILLISECS") start-time) 50))
			)
		)
		(setq frame (1+ frame))
	)

	(princ "\nPlayback complete.")
)