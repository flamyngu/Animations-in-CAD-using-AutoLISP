@echo off
echo =========================================
echo   PBM Video Converter - Dependency Check
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

REM Check for Python
echo Checking for Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in PATH!
    echo Please download Python from: https://python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation.
    echo.
    pause
    exit /b 1
) else (
    echo [OK] Python found
    python --version
)

REM Check for ImageMagick (used by convert.py)
echo Checking for ImageMagick...
magick -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] ImageMagick not found!
    echo This is needed by convert.py to process PBM files.
    echo Download from: https://imagemagick.org/script/download.php#windows
    echo The script will attempt to install it automatically later.
) else (
    echo [OK] ImageMagick found
)

REM Check for convert.py
echo Checking for convert.py...
if not exist convert.py (
    echo [ERROR] convert.py not found in current directory!
    echo Please make sure convert.py is in the same folder as this batch file.
    echo.
    pause
    exit /b 1
) else (
    echo [OK] convert.py found
)

REM Check for writePathsToTXT.py
echo Checking for writePathsToTXT.py...
if not exist writePathsToTXT.py (
    echo [ERROR] writePathsToTXT.py not found in current directory!
    echo Please make sure writePathsToTXT.py is in the same folder as this batch file.
    echo.
    pause
    exit /b 1
) else (
    echo [OK] writePathsToTXT.py found
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
    if not exist framesPBM mkdir framesPBM
    ffmpeg -i "%videofile%" -vf fps=5,scale=50:37 framesPBM/frame_%%04d.pbm
    echo Done! All PBM frames are in the "framesPBM" folder.
    
    REM Copy convert.py to framesPBM folder and execute it
    if exist convert.py (
        copy convert.py framesPBM\convert.py
        copy writePathsToTXT.py framesPBM\writePathsToTXT.py
        cd framesPBM
        echo.
        echo =========================================
        echo Running convert.py in framesPBM folder...
        echo =========================================
        python convert.py
        if %errorlevel% neq 0 (
            echo [ERROR] convert.py failed to execute properly!
            cd ..
            pause
            exit /b 1
        )
        echo.
        echo =========================================
        echo Running writePathsToTXT.py in framesPBM folder...
        echo =========================================
        python writePathsToTXT.py
        if %errorlevel% neq 0 (
            echo [WARNING] writePathsToTXT.py failed to execute properly!
        ) else (
            echo [SUCCESS] File paths written to frames_list.txt!
        )
        cd ..
        echo [SUCCESS] PBM conversion and path generation completed in framesPBM folder!
    ) else (
        echo [ERROR] convert.py not found in current directory!
        pause
        exit /b 1
    )
    
) else (
    ffmpeg -i "%videofile%" -vf fps=5,scale=50:37 frames/frame_%%04d.pbm
    echo Done! All PBM frames are in the "frames" folder.
    
    REM Copy convert.py to frames folder and execute it
    if exist convert.py (
        copy convert.py frames\convert.py
        copy writePathsToTXT.py frames\writePathsToTXT.py
        cd frames
        echo.
        echo =========================================
        echo Running convert.py in frames folder...
        echo =========================================
        python convert.py
        if %errorlevel% neq 0 (
            echo [ERROR] convert.py failed to execute properly!
            cd ..
            pause
            exit /b 1
        )
        echo.
        echo =========================================
        echo Running writePathsToTXT.py in frames folder...
        echo =========================================
        python writePathsToTXT.py
        if %errorlevel% neq 0 (
            echo [WARNING] writePathsToTXT.py failed to execute properly!
        ) else (
            echo [SUCCESS] File paths written to frames_list.txt!
        )
        cd ..
        echo [SUCCESS] PBM conversion and path generation completed in frames folder!
    ) else (
        echo [ERROR] convert.py not found in current directory!
        pause
        exit /b 1
    )
)

echo.
echo =========================================
echo ALL OPERATIONS COMPLETED SUCCESSFULLY!
echo =========================================
echo Video has been converted to PBM frames
echo PBM files have been processed to P1 format
echo File paths have been written to frames_list.txt
echo Ready for use with AutoLISP animation scripts
echo =========================================
pause
exit /b