@echo off
echo =========================================
echo   BMP Video Converter - Dependency Check
echo =========================================
echo.

REM Check for FFmpeg
echo Checking for FFmpeg...
ffmpeg -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] FFmpeg is not installed or not in PATH!
    echo Please download FFmpeg from: https://ffmpeg.org/download.html
    echo Add it to your system PATH or place ffmpeg.exe in this folder.
    echo.
    pause
    exit /b 1
) else (
    echo [OK] FFmpeg found
)

echo.
echo =========================================
echo All dependency checks completed!
echo =========================================
echo.

set /p videofile="Please enter the path to the video file (e.g., C:\Videos\badapple.mp4): "

if not exist "%videofile%" (
    echo File not found!
    pause
    exit /b
)
if not exist frames mkdir frames

if exist frames (
    if not exist framesBMP mkdir framesBMP
    echo Converting video to BMP frames...
    ffmpeg -i "%videofile%" -vf fps=30,scale=500:370 framesBMP/frame_%%04d.bmp
    echo [SUCCESS] All BMP frames are in the "framesBMP" folder!
    
) else (
    echo Converting video to BMP frames...
    ffmpeg -i "%videofile%" -vf fps=30,scale=500:370 frames/frame_%%04d.bmp
    echo [SUCCESS] All BMP frames are in the "frames" folder!
)

echo.
echo =========================================
echo BMP CONVERSION COMPLETED SUCCESSFULLY!
echo =========================================
echo Video has been converted to BMP frames
echo Ready for use with AutoLISP animation scripts
echo =========================================
pause
exit /b




