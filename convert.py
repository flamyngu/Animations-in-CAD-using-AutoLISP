import subprocess
import os

def convert_p4_to_p1_in_folder(folder_path):
    for filename in os.listdir(folder_path):
        if filename.lower().endswith(".pbm"):
            full_path = os.path.join(folder_path, filename)
            print(f"Processing {filename}...")
            try:
               subprocess.run(["magick", full_path, "-compress", "none", full_path], check=True)
               print(f"Successfully converted {filename} to P1 format.")
            except Exception as e:
                print(f"Failed to convert {filename}: {e}")

if __name__ == "__main__":
    folder = os.getcwd()  # aktuelles Verzeichnis
    # Alternativ z.B.: folder = "C:/Users/dodo/Documents/GitHub/Animations-in-CAD-using-AutoLISP/frames"
    convert_p4_to_p1_in_folder(folder)
