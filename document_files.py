import os

def document_files(directory):
    documentation = []
    for root, dirs, files in os.walk(directory):
        print(f"Vizsgált könyvtár: {root}")
        for file in files:
            if file.endswith(".java"):
                file_path = os.path.join(root, file)
                print(f"Vizsgált fájl: {file_path}")
                with open(file_path, 'r', encoding='utf-8') as f:
                    lines = f.readlines()
                    class_name = None
                    class_description = 'No description available'
                    methods = []

                    for i, line in enumerate(lines):
                        if "class " in line:
                            class_name = line.strip()
                            for j in range(i-1, max(i-4, -1), -1):
                                if lines[j].strip().startswith('*') or lines[j].strip().startswith('//'):
                                    class_description = lines[j].strip()
                                    break

                        if line.strip().startswith("public ") or line.strip().startswith("private ") or line.strip().startswith("protected "):
                            method_line = line.strip()
                            method_comment = 'No comment'
                            if i > 0 and (lines[i-1].strip().startswith('*') or lines[i-1].strip().startswith('//')):
                                method_comment = lines[i-1].strip()
                            methods.append(f"{method_line} - {method_comment}")

                    methods_description = "\n    ".join(methods) if methods else "No methods available"
                    documentation.append(f"**{file}**: {class_name} - {class_description}\n    Methods:\n    {methods_description}")

    return documentation

if __name__ == "__main__":
    docs = document_files('/home/debiana/w3school/objexamples/police')  # Teljes projektgyökér vizsgálata
    with open('FILE_DESCRIPTIONS.md', 'w', encoding='utf-8') as f:
        for line in docs:
            f.write(line + "\n")

    print("FILE_DESCRIPTIONS.md fájl sikeresen létrehozva.")

