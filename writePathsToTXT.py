import os

def write_pbm_filenames_to_txt(folder_path, output_txt_path):
    # Alle Dateien im Ordner filtern, die auf .pbm enden (Groß-/Kleinschreibung ignorieren)
    pbm_files = [f for f in os.listdir(folder_path) if f.lower().endswith('.pbm')]

    if not pbm_files:
        print("Keine .pbm-Dateien im Ordner gefunden.")
        return

    with open(output_txt_path, 'w') as outfile:
        for filename in pbm_files:
            full_path = os.path.join(folder_path, filename)
            outfile.write(full_path + '\n')

    print(f"{len(pbm_files)} Dateinamen wurden in '{output_txt_path}' geschrieben.")
if __name__ == "__main__":
    folder = os.getcwd()  # aktuelles Verzeichnis
    output_file = "frames_list.txt"  # Standard-Ausgabedatei
    write_pbm_filenames_to_txt(folder, output_file)
