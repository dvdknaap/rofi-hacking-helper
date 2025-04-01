import os
import json

CODE_ROOT = "~/Desktop/base"
SCRIPTS_DIR = os.path.expanduser(f"{CODE_ROOT}/code/xdotool/scripts/")
JSON_PATH = os.path.expanduser(f"{CODE_ROOT}/documentation/scripts_list.json")

HTML_TEMPLATE_PATH = os.path.expanduser(f"{CODE_ROOT}/documentation/templates/scripts_list.html")
OUTPUT_HTML_PATH = os.path.expanduser(f"{CODE_ROOT}/documentation/index.html")

MARKDOWN_PATH = os.path.expanduser(f"{CODE_ROOT}/documentation/scripts_list.md")
MARKDOWN_TEMPLATE_PATH = os.path.expanduser(f"{CODE_ROOT}/documentation/templates/scripts_list.md")

def get_description(path):
    """Return description of the file or directory."""
    description = ""
    
    # Check if the path is a file
    if os.path.isfile(path):
        # If the file is within a 'proxychains' directory, get description from parent directory
        if '/proxychains' in path:
            parent_dir = path.replace('/proxychains', '')
            with open(parent_dir, 'r') as file:
                content = file.read()
                if ": '" in content and "'" in content:
                    start = content.find(": '") + 3
                    end = content.find("'", start)
                    description = f"proxychains: {content[start:end].strip()}"
        else:
            # For non-proxychains files, read the description from the file content (comments)
            with open(path, 'r') as file:
                content = file.read()
                if ": '" in content and "'" in content:
                    start = content.find(": '") + 3
                    end = content.find("'", start)
                    description = content[start:end].strip()

    # Check if the path is a directory
    elif os.path.isdir(path):
        desc_file = os.path.join(path, '.desc')

        # If it's the 'proxychains' directory, get description from parent directory
        if 'proxychains' in path.split(os.sep):
            parent_dir = os.path.dirname(path)
            parent_desc_file = os.path.join(parent_dir, '.desc')
            
            # Check if the parent directory has a description
            if os.path.isfile(parent_desc_file):
                with open(parent_desc_file, 'r') as file:
                    parent_description = file.read().strip()
                    description = f"proxychains: {parent_description}"

        # Otherwise, just read the description from the .desc file in the directory
        elif os.path.isfile(desc_file):
            with open(desc_file, 'r') as file:
                description = file.read().strip()

    return description

def collect_files(base_path):
    """Collects and sorts all script files in the given directory."""
    files = sorted(
        [f for f in os.listdir(base_path) if os.path.isfile(os.path.join(base_path, f)) and not f.startswith('.')]
    )
    
    items = []
    for file in files:
        file_path = os.path.join(base_path, file)

        items.append({
            "type": "script",
            "path": file_path.replace(SCRIPTS_DIR, ""),
            "description": get_description(file_path)
        })
    
    return items

def collect_dirs(base_path):
    """Recursively collects directories first, then scripts, while ensuring `dynamicFields` stays on top."""
    entries = os.listdir(base_path)
    
    directories = sorted(
        [d for d in entries if os.path.isdir(os.path.join(base_path, d)) and not d.startswith('.')]
    )

    if "dynamicFields" in directories:
        directories.remove("dynamicFields")
        directories.insert(0, "dynamicFields")

    items = []
    
    for directory in directories:
        dir_path = os.path.join(base_path, directory)

        items.append({
            "type": "directory",
            "path": dir_path.replace(SCRIPTS_DIR, ""),
            "description": get_description(dir_path)
        })

        items.extend(collect_files(dir_path))
        items.extend(collect_dirs(dir_path))

    return items

def generate_json():
    """Generates JSON and saves it to the file."""
    data = collect_dirs(SCRIPTS_DIR) + collect_files(SCRIPTS_DIR)
    with open(JSON_PATH, 'w') as json_file:
        json.dump(data, json_file, indent=4)

    print(f"✅  JSON generated: {JSON_PATH}")

def load_json():
    """Load JSON data from file."""
    with open(JSON_PATH, 'r') as json_file:
        return json.load(json_file)
    
def generate_html():
    """Reads the template, filters only script files, and inserts them as JSON."""
    scripts = load_json()
    script_list = []
    folder_paths = set()

    for script in scripts:
        if script["type"] == "script":
            script_list.append(script)
        elif script["type"] == "directory":
            folder_paths.add(script["path"])

    script_count = len(script_list)
    folder_count = len(folder_paths)

    scripts_json = json.dumps(script_list, indent=4)

    with open(HTML_TEMPLATE_PATH, 'r') as template_file:
        template = template_file.read()

    output_html = template.replace("[script_count]", f"{script_count}")
    output_html = output_html.replace("[folder_count]", f"{folder_count}")
    output_html = output_html.replace("[scripts]", scripts_json)

    with open(OUTPUT_HTML_PATH, 'w') as output_file:
        output_file.write(output_html)

    print(f"✅  HTML generated: {OUTPUT_HTML_PATH}")

def generate_markdown():
    """Generate a markdown file from the script data, preserving JSON order."""
    scripts = load_json()
    script_list = []
    folder_paths = set()

    main_script = "Main Scripts"
    toc = f"- [{main_script}](#{main_script.lower().replace(' ', '-')})\n"
    sections = ""
    directories = {}
    directories[main_script] = {"description": "", "files": []}
    
    for script in scripts:
        folder = script["path"]
        description = script["description"]

        if script["type"] == "directory":
            folder_paths.add(script["path"])

            if not "/" in folder:
                toc += f"- [{folder}](#{folder.lower().replace(' ', '-')})\n"

            directories[folder] = {"description": description, "files": []}

        elif script["type"] == "script":
            script_list.append(script)

            dir_name = os.path.dirname(folder) or main_script
            icon = "📜"
            script_entry = f"| {icon} `{script['path']}` | {script['description']} |\n"
            directories[dir_name]['files'].append(script_entry)


    script_count = len(script_list)
    folder_count = len(folder_paths)

    # TOC met alleen root directories
    for folder, data in directories.items():

        sections += f"\n### {folder}\n\n"
        if data["description"]:
            sections += f"{data['description']}\n\n"
        if data["files"]:
            sections += "| Path | Description |\n|------|-------------|\n"
            sections += "".join(data["files"])
        sections += "<br />\n"

    with open(MARKDOWN_TEMPLATE_PATH, 'r') as template_file:
        template = template_file.read()

    output_md = template.replace("{{SCRIPTS_COUNT}}", str(script_count))
    output_md = output_md.replace("{{FOLDER_COUNT}}", str(folder_count))
    output_md = output_md.replace("{{TOC}}", toc.strip())
    output_md = output_md.replace("{{SCRIPTS}}", sections.strip())

    with open(MARKDOWN_PATH, 'w') as output_file:
        output_file.write(output_md)

    print(f"✅  Markdown generated: {MARKDOWN_PATH}")


def main():
    generate_json()
    generate_html()
    generate_markdown()

if __name__ == "__main__":
    main()
