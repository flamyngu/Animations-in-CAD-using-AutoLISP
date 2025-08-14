import subprocess
import os
import sys

# Check if ImageMagick is available
def check_imagemagick():
    try:
        result = subprocess.run(
            ["magick", "-version"], 
            check=True, 
            capture_output=True, 
            text=True
        )
        print(f"✅ ImageMagick found: {result.stdout.split()[2]}")
        return True
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("❌ ImageMagick not found!")
        return False

def install_imagemagick():
    """Automatically install ImageMagick using winget or chocolatey"""
    print("\n🔄 Attempting to install ImageMagick automatically...")
    
    # Try winget first (Windows Package Manager)
    try:
        print("📦 Trying installation via winget...")
        result = subprocess.run(
            ["winget", "install", "--id", "ImageMagick.ImageMagick", "--silent", "--accept-package-agreements", "--accept-source-agreements"],
            check=True,
            capture_output=True,
            text=True
        )
        print("✅ ImageMagick installed successfully via winget!")
        return True
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("❌ winget installation failed or winget not available")
    
    # Try chocolatey as backup
    try:
        print("📦 Trying installation via chocolatey...")
        result = subprocess.run(
            ["choco", "install", "imagemagick", "-y"],
            check=True,
            capture_output=True,
            text=True
        )
        print("✅ ImageMagick installed successfully via chocolatey!")
        return True
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("❌ chocolatey installation failed or chocolatey not available")
    
    # Try pip-installable alternative (Pillow + imageio)
    try:
        print("📦 Installing Python imaging alternative (Pillow)...")
        subprocess.run([sys.executable, "-m", "pip", "install", "Pillow"], check=True)
        print("✅ Pillow installed as alternative!")
        return "pillow"
    except subprocess.CalledProcessError:
        print("❌ Failed to install Pillow alternative")
    
    return False

def convert_with_pillow(input_file, output_file):
    """Alternative conversion using Pillow if ImageMagick not available"""
    try:
        from PIL import Image
        
        # Open and save image (this will convert format automatically)
        with Image.open(input_file) as img:
            # Convert to 1-bit (black and white) if needed
            if img.mode != '1':
                img = img.convert('1')
            img.save(output_file, format='PPM', optimize=False)
        return True
    except Exception as e:
        return False

# Try to import tqdm, install if not available
try:
    from tqdm import tqdm
except ImportError:
    print("Installing tqdm for progress bar...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "tqdm"])
    from tqdm import tqdm

def convert_p4_to_p1_in_folder(folder_path):
    # Check ImageMagick first
    print("🔍 Checking dependencies...")
    use_pillow = False
    
    if not check_imagemagick():
        print("\n💡 ImageMagick not found. Attempting automatic installation...")
        
        # Ask user for permission
        response = input("Do you want to install ImageMagick automatically? (y/n): ").lower()
        if response in ['y', 'yes', 'j', 'ja']:
            install_result = install_imagemagick()
            
            if install_result == "pillow":
                use_pillow = True
                print("📝 Will use Pillow as alternative to ImageMagick")
            elif install_result:
                # Check again after installation
                print("\n🔄 Checking ImageMagick after installation...")
                if not check_imagemagick():
                    print("⚠️ ImageMagick installation may require system restart")
                    print("💡 Switching to Pillow alternative for now...")
                    use_pillow = True
            else:
                print("\n❌ Automatic installation failed!")
                print("📋 Please install ImageMagick manually:")
                print("   • Download: https://imagemagick.org/script/download.php#windows")
                print("   • Or use: winget install ImageMagick.ImageMagick")
                print("   • Or use: choco install imagemagick")
                input("\nPress Enter to exit...")
                sys.exit(1)
        else:
            print("❌ Cannot proceed without ImageMagick!")
            input("Press Enter to exit...")
            sys.exit(1)
    
    # Get all PBM files first
    pbm_files = [f for f in os.listdir(folder_path) if f.lower().endswith(".pbm")]
    
    if not pbm_files:
        print("No PBM files found in the current directory!")
        return
    
    print(f"\n✅ Found {len(pbm_files)} PBM files to convert")
    conversion_method = "Pillow (Python)" if use_pillow else "ImageMagick"
    print(f"🔄 Converting P4 format to P1 format using {conversion_method}...\n")
    
    # Create progress bar with custom styling
    with tqdm(
        pbm_files, 
        desc="🔄 Converting PBM files",
        unit="files",
        bar_format="{l_bar}{bar}| {n_fmt}/{total_fmt} [{elapsed}<{remaining}, {rate_fmt}]",
        colour="green",
        ncols=80
    ) as pbar:
        
        success_count = 0
        error_count = 0
        
        for filename in pbar:
            full_path = os.path.join(folder_path, filename)
            
            # Update progress bar description with current file
            pbar.set_postfix_str(f"📄 {filename[:20]}...")
            
            try:
                if use_pillow:
                    # Use Pillow for conversion
                    success = convert_with_pillow(full_path, full_path)
                    if success:
                        success_count += 1
                        pbar.set_postfix_str(f"✅ {filename[:15]}... OK")
                    else:
                        error_count += 1
                        pbar.set_postfix_str(f"❌ {filename[:15]}... ERROR")
                else:
                    # Use ImageMagick for conversion
                    subprocess.run(
                        ["magick", full_path, "-compress", "none", full_path], 
                        check=True,
                        stdout=subprocess.DEVNULL,
                        stderr=subprocess.DEVNULL
                    )
                    success_count += 1
                    pbar.set_postfix_str(f"✅ {filename[:15]}... OK")
                
            except subprocess.CalledProcessError as e:
                error_count += 1
                pbar.set_postfix_str(f"❌ {filename[:15]}... ERROR")
                
            except Exception as e:
                error_count += 1
                pbar.set_postfix_str(f"❌ {filename[:15]}... FAILED")
    
    # Final summary
    print(f"\n{'='*60}")
    print(f" CONVERSION COMPLETE!")
    print(f" Successfully converted: {success_count} files")
    if error_count > 0:
        print(f" Failed conversions: {error_count} files")
    print(f" Output folder: {folder_path}")
    print(f"{'='*60}")

if __name__ == "__main__":
    folder = os.getcwd()  # aktuelles Verzeichnis
    # Alternativ z.B.: folder = "C:/Users/dodo/Documents/GitHub/Animations-in-CAD-using-AutoLISP/frames"
    convert_p4_to_p1_in_folder(folder)
