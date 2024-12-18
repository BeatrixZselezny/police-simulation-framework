import os

def generate_comments(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".java"):
                file_path = os.path.join(root, file)
                with open(file_path, 'r+', encoding='utf-8') as f:
                    lines = f.readlines()
                    f.seek(0)
                    f.truncate()
                    for i, line in enumerate(lines):
                        if "class " in line and not any(x in lines[i-1] for x in ['//', '/**']):
                            f.write(f"// This class is named {line.split('class ')[1].split(' ')[0].strip()}\n")
                        elif any(x in line for x in ["public ", "private ", "protected "]) and "class " not in line and not any(x in lines[i-1] for x in ['//', '/**']):
                            method_name = line.split('(')[0].strip().split(' ')[-1]
                            f.write(f"// This method is named {method_name}\n")
                        f.write(line)

if __name__ == "__main__":
    generate_comments('/home/debiana/w3school/objexamples/police')  # Teljes projektgyökér vizsgálata
    print("Automatikus kommentek hozzáadva.")
