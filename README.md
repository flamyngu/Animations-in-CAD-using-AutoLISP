
# AutoLISP PBM Frame Drawer (`c:drawpbm`)

This AutoLISP script allows you to load and draw PBM (Portable Bitmap) image frames inside nanoCAD or AutoCAD by converting black pixels into rectangles on the CAD canvas. It is designed for frame-by-frame animations, but can also be used to display a single PBM image.

---

## Features

- Reads ASCII PBM (P1) format files
- Parses each line and draws filled rectangles for black pixels
- Scales pixels to adjustable sizes
- Fast drawing using lightweight polylines (rectangles)
- Compatible with nanoCAD 5 and AutoCAD

---

## Prerequisites

- nanoCAD 5 or AutoCAD with AutoLISP support
- PBM files in ASCII P1 format
- The `draw_frame.lsp` script loaded into the CAD environment

---

## How to Use `c:drawpbm`

### 1. Load the Script

- Open your CAD software (nanoCAD or AutoCAD)
- Load the AutoLISP script `draw_frame.lsp` using the `APPLOAD` command or your preferred method.

### 2. Run the Command

- In the command line, type: `drawpbm` or `DRAWPBM` or `c:drawpbm`
- Press Enter.

### 3. Select a PBM File

- A file selection dialog will appear.
- Navigate to the folder containing your PBM files.
- Select the desired `.pbm` file in ASCII P1 format.
- Confirm the selection.

### 4. View the Drawing

- The script will parse the PBM file.
- Black pixels will be drawn as filled rectangles on the CAD canvas.
- The drawing will be scaled by a default pixel size (can be changed in the script).
- The drawing appears in the **Model Space**.

---

## Notes

- The script expects PBM files to be in **ASCII P1** format, not binary (P4).
- You can modify the `scale` variable inside the `draw-frame` function to change the size of each pixel rectangle.

---

## Troubleshooting

- If the script does not draw anything:
- Ensure the PBM file is ASCII P1 format (you can convert binary PBM to ASCII using tools like ImageMagick or by putting the `convert.py` file inside yout PBM-files-directory and running it in a shell).
- Make sure you are in Model Space.
- Check that the script is properly loaded.

- If you encounter errors with missing functions (e.g. `vl-string-subset`):
- The script contains fallback implementations to improve compatibility with nanoCAD.

---

## Example PBM Conversion with FFmpeg

To extract PBM frames from a video (e.g. `badapple.mp4`) for your animation, use:

```bash
ffmpeg -i badapple.mp4 -vf fps=5,scale=200:148 frames/frame_%04d.pbm



I am currently working on a way to display the frames rapidly after one another, basically creating a video player inside nanoCAD/AutoCAD
