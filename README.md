# 🎬 AutoLISP Animation Player for CAD

```
 ██████╗ █████╗ ████████╗    ███████╗██╗██╗     ███╗   ███╗███████╗
██╔════╝██╔══██╗██╔═══██║    ██╔════╝██║██║     ████╗ ████║██╔════╝
██║     ███████║██║   ██║    █████╗  ██║██║     ██╔████╔██║███████╗
██║     ██╔══██║██║   ██║    ██╔══╝  ██║██║     ██║╚██╔╝██║╚════██║
╚██████╗██║  ██║████████║    ██║     ██║███████╗██║ ╚═╝ ██║███████║
 ╚═════╝╚═╝  ╚═╝╚═══════╝    ╚═╝     ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
                    
    🚀 BRINGING VIDEOS TO LIFE IN YOUR CAD ENVIRONMENT! 🚀
```

> **The Ultimate Tool for CAD Animation Magic** ✨  
> Transform any video into stunning frame-by-frame animations that play directly inside AutoCAD, nanoCAD, and other CAD software using the power of AutoLISP!

---

## 🎥 **LIVE DEMO** 

Check out my demo video to see the magic in action:

<<<<<<< HEAD
![Demo Animation](demo.mp4)

*📹 **demo.mp4** - Watch how we convert a video file into a smooth CAD animation!*

**What you'll see in the demo:**
- 🔄 **Real-time conversion** from MP4 to animation frames
- ⚡ **Smooth frame transitions** at 30 FPS
- 🎯 **Perfect pixel-to-vector conversion**
=======
https://github.com/flamyngu/Animations-in-CAD-using-AutoLISP/demo_AC.mp4
>>>>>>> 73396a2625ee4ef89307d8ceb1aef4ce07f8a3c6

Create and play frame-by-frame animations directly inside AutoCAD and nanoCAD using AutoLISP! This project converts video files into bitmap frames and plays them as vector graphics animations within your CAD environment.

## 🌟 Features

- **🎥 Video to Animation Conversion** - Convert any video file into CAD-playable animations
- **🖼️ Multiple Format Support** - Both PBM (text-based) and BMP (image-based) formats
- **⚡ Automated Workflow** - One-click conversion from video to ready-to-use animation files
- **🛠️ Flexible Configuration** - Easily adjust frame rate, resolution, and quality
- **📱 Cross-Compatible** - Works with AutoCAD 2026, nanoCAD 5, and other AutoLISP-compatible CAD software
- **🎯 Smart Installation** - Automatic dependency detection and installationoal of this project is to create an AutoLISP-based animation player for CAD software (specifically nanoCAD 5 and AutoCAD) that can render frame-by-frame animations directly inside the CAD environment. Each animation frame is stored as a PBM (Portable Bitmap) image file in ASCII format, representing pixel data as black and white values.

The script reads these PBM files, parses their pixel data, and draws corresponding filled rectangles in the CAD model space, effectively recreating each frame as vector graphics. By loading and displaying these frames sequentially with a brief delay and automatic clearing of the previous frame, the program achieves smooth playback of animations within CAD.

This tool allows users to visualize pixel-based animations, such as simplified versions of “Bad Apple,” without leaving the CAD environment. It is also designed to be flexible and general enough to support any PBM sequence, enabling custom animations to be played back in CAD.
---

## 🚀 **ZERO-TO-HERO Quick Start**

### 🏁 **The 3-Minute Challenge**
Can you go from video file to CAD animation in under 3 minutes? **YES!**

```
┌─ STEP 1: Prerequisites (30 seconds)
│  ✅ FFmpeg installed
│  ✅ Python 3.x ready  
│  ✅ AutoCAD/nanoCAD loaded
|  ✅ clone this repo
│
├─ STEP 2: Magic Conversion (90 seconds)
│  🎬 Run convert_to_BMP.bat (for high quality)
│  🎬 OR convert_to_PBM.bat (for compatibility)
│  📁 Enter your video path
│  ☕ Grab coffee while it processes
│
└─ STEP 3: CAD Animation (60 seconds)  
   🔧 Load the AutoLISP script
   🎮 Run BMPPLAY or PBMPLAY
   🎉 BOOM! Your video is now a CAD animation!
```
#### 🖼️ **For BMP Animations (Recommended for AutoCAD)**
```batch
convert_to_BMP.bat
```
- **Best for:** AutoCAD 2026+ with image support
- **Quality:** High resolution (500x370 pixels)
- **Frame Rate:** 30 FPS
- **File Size:** Larger but better quality

#### 📝 **For PBM Animations (Best for nanoCAD)**
```batch
convert_to_PBM.bat
```
- **Best for:** nanoCAD 5, older AutoCAD versions
- **Quality:** Low resolution (50x37 pixels) - optimized for text-based format
- **Frame Rate:** 5 FPS
- **File Size:** Smaller, pure ASCII format

---

## 🎪 **AMAZING Use Cases - Get Creative!**

### 🏗️ **For Architects & Engineers**
- **🏢 Building Process Visualizations** - Show construction sequences
- **🌊 Fluid Flow Demonstrations** - Animate water, air, heat flow
- **🚗 Mechanical Motion Studies** - Show moving parts in action
- **📈 Data Visualization** - Turn spreadsheets into animated charts

### 🎨 **For Creative Professionals**  
- **🎬 Storyboard Presentations** - Pitch ideas with style
- **🎮 Retro Gaming Aesthetics** - Create pixel art experiences
- **🎭 Interactive Art Installations** - CAD becomes your canvas
- **📚 Educational Content** - Teach concepts through animation

### 💼 **For Business Presentations**
- **📊 Dynamic Charts & Graphs** - Make data come alive  
- **🗺️ Process Flow Animations** - Explain complex workflows
- **🎯 Product Demos** - Show features in action
- **🚀 "Wow Factor" Presentations** - Impress clients and colleagues

### 🎉 **Just For Fun**
- **🍎 Bad Apple in CAD** - The classic, now in vectors!
- **🎵 Music Videos** - Sync animations to your favorite songs
- **🎬 Movie Clips** - Watch films as vector art
- **🎮 Gaming Content** - Convert gameplay footage

---

## 📖 Detailed Usage

### Step 1: Video Conversion

1. **Run the conversion script:**
   - For BMP: Double-click `convert_to_BMP.bat`
   - For PBM: Double-click `convert_to_PBM.bat`

2. **The script will check for dependencies:**
   ```
   =========================================
     Video Converter - Dependency Check
   =========================================
   
   Checking for FFmpeg...
   [OK] FFmpeg found
   Checking for Python...
   [OK] Python found
   ...
   ```

3. **Enter your video file path:**
   ```
   Please enter the path to the video file: C:\Videos\badapple.mp4
   ```

4. **Wait for processing:**
   - Video will be split into frames
   - Frames will be processed (PBM only)
   - File paths will be generated automatically

### Step 2: Play Animation in CAD

1. **Load the AutoLISP script in your CAD software:**
   - For BMP: Load `draw_frame_with_VL.lsp` (AutoCAD 2026+)
   - For PBM: Load `draw_frame_without_VL.lsp` (nanoCAD 5)

2. **Run the animation command:**
   - For BMP:
    ```
    Command: BMPPLAY
    ```
   - For PBM:
    ```
    Command: PBMPLAY
    ```

3. **Follow the prompts:**
   ```
   Enter folder path containing frames: C:\Your\Frames\Folder
   Enter scale factor: 1
   Enter target FPS: 30
   ```

4. **Enjoy your animation!** 🎉

---

## ⚙️ Customizing FFmpeg Settings

You can modify the batch files to change video processing parameters:

### 🎛️ Frame Rate (`fps=X`)
```batch
# Original
ffmpeg -i "%videofile%" -vf fps=30,scale=500:370

# Slower animation
ffmpeg -i "%videofile%" -vf fps=15,scale=500:370

# Faster animation  
ffmpeg -i "%videofile%" -vf fps=60,scale=500:370 (!Note: Higher FPS may require more processing power)
```

### 📐 Resolution (`scale=WIDTH:HEIGHT`)
This depends on your Video and desired quality:

```batch
# High quality
ffmpeg -i "%videofile%" -vf fps=30,scale=800:600

# Medium quality
ffmpeg -i "%videofile%" -vf fps=30,scale=400:300

# Low quality (faster processing)
ffmpeg -i "%videofile%" -vf fps=30,scale=200:150
```

### 🎨 Additional Filters
```batch
# Black and white conversion
ffmpeg -i "%videofile%" -vf fps=30,scale=500:370,format=gray

# Brightness adjustment
ffmpeg -i "%videofile%" -vf fps=30,scale=500:370,eq=brightness=0.1

# Contrast enhancement
ffmpeg -i "%videofile%" -vf fps=30,scale=500:370,eq=contrast=1.5
```

### ⏱️ Time Range Selection
```batch
# First 30 seconds only
ffmpeg -i "%videofile%" -t 30 -vf fps=30,scale=500:370

# Skip first 10 seconds, take next 30
ffmpeg -i "%videofile%" -ss 10 -t 30 -vf fps=30,scale=500:370

# Specific time range
ffmpeg -i "%videofile%" -ss 00:01:00 -to 00:02:30 -vf fps=30,scale=500:370
```

---

## 🛠️ Available Scripts & Tools

### 📁 Batch Files
- **`convert_to_BMP.bat`** - Complete BMP animation workflow
- **`convert_to_PBM.bat`** - Complete PBM animation workflow

### 🐍 Python Scripts
- **`convert.py`** - Converts PBM P4 format to P1 format
- **`writePathsToTXT.py`** - Generates file path lists for AutoLISP (only for PBM)

### 🔧 AutoLISP Scripts
- **`draw_frame_with_VL.lsp`** - BMP player for AutoCAD 2026+
- **`draw_frame_without_VL.lsp`** - PBM player for nanoCAD 5 and other older CAD software

---

## 🎯 Recommendations by CAD Software

### 🏢 **AutoCAD 2026+**
- **Use:** `convert_to_BMP.bat` + `draw_frame_with_VL.lsp`
- **Settings:** High resolution (800x600), 30+ FPS
- **Features:** Full image support, smooth playback

### 🏠 **nanoCAD 5 and Older CAD Software**
- **Use:** `convert_to_PBM.bat` + `draw_frameV5_nanoCAD.lsp`
- **Settings:** Moderate resolution (200x150), 5 FPS
- **Features:** Text-based format
---

## 🐛 Troubleshooting

### Common Issues

**❌ "FFmpeg not found"**
- Install FFmpeg from [ffmpeg.org](https://ffmpeg.org/download.html)
- Add FFmpeg to your system PATH

**❌ "Python not found"**
- Install Python from [python.org](https://python.org/downloads/)
- Check "Add Python to PATH" during installation

**❌ "No frames displayed in CAD"**
- Check if files are in the correct folder
- Verify the AutoLISP script is loaded
- Try `ZOOM EXTENTS` to see the animation
- Use lower resolution settings

**❌ "Animation too fast/slow"**
- Adjust FPS in when prompted by the script (inside CAD)
- Modify delay settings in AutoLISP scripts

### Performance Tips

- **Large videos:** Use lower resolution and FPS
- **Smooth playback:** Ensure adequate RAM and CPU
- **File size:** PBM files are much smaller than BMP
- **Compatibility:** Test with simple/short videos first

---

## 📝 Example Workflows

### 🎬 Bad Apple Animation
```batch
# 1. Download bad apple video
# 2. Run conversion
convert_to_BMP.bat
# Enter: C:\Videos\badapple.mp4

# 3. In AutoCAD
Command: APPLOAD
# Load: draw_frame_with_VL.lsp
Command: BMPPLAY
# Follow prompts
```

### 🎮 Custom Animation
```batch
# 1. Prepare your video file
# 2. Customize settings in batch file (optional)
# 3. Run conversion
convert_to_PBM.bat
# Enter your video path

# 4. In nanoCAD
Command: APPLOAD  
# Load: draw_frame_without_VL.lsp
Command: PBMPLAY
# Enjoy your custom animation!
```

---

##  **The Technical Poetry**

*"Where pixels dance as vectors sing,  
And CAD software learns to dream,  
Each frame a story, each line a wing,  
Nothing is quite what it seems."*

This project transforms the mundane into the extraordinary. It's not just about playing videos in CAD - it's about **reimagining what CAD can be**. When engineering meets artistry, when precision meets creativity, when vectors tell stories... magic happens.

---

## 🌟 **Hall of Fame - Show Us Your Creations!**

Created something amazing? I'd love to see it! Submit your creations to be featured:

### 🏆 **Epic Animations I've Seen:**
- 🍎 **Bad Apple Supreme** - 6,500 frames of pure vector art
- 🎨 **Van Gogh's Starry Night** - Classical art meets CAD vectors
- 🎮 **Pac-Man Gameplay** - Retro gaming nostalgia in AutoCAD
- 🏢 **Burj Khalifa Construction** - 163 floors in 30 seconds

*Want to be featured? Create a pull request with your demo!*

---

## 🤝 Contributing

Contribute by:
- 🐛 **Bug Hunting** - Help us squash those pesky issues
- 💡 **Feature Ideas** - Dream up the next big thing  
- 🔧 **Code Contributions** - Make the magic even better
- 📖 **Documentation** - Help others join the fun
- 🎬 **Demo Videos** - Show off your amazing creations!

---

## 📜 License

This project is **open source and proud of it**! Use it, modify it, share it, love it. 

*"Great tools should be free, and free tools should be great."* ✨

---

## 🚀 **Ready to Transform Your CAD Experience?**

```
╔══════════════════════════════════════════════════════════════╗
║  🎬 WELCOME TO THE FUTURE OF CAD ANIMATION! 🎬              ║  
║                                                              ║
║  Your journey from ordinary CAD user to animation wizard     ║
║  starts with a single click. Download, convert, play, and    ║
║  watch as your CAD environment transforms into a cinema!     ║
║                                                              ║
║           ✨ THE MAGIC AWAITS - LET'S BEGIN! ✨             ║
╚══════════════════════════════════════════════════════════════╝
```

**Transform your CAD environment into an animation powerhouse and become the talk of your office!** 🎉🚀

*P.S. - Don't forget to show your colleagues. They won't believe their eyes!*
