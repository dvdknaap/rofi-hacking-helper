#!/bin/bash

# Base directory
BASE_DIR="documentation"

# Folder structure with explanation
declare -A folder_descriptions
folder_descriptions["admin"]="Scope of Work (SoW) that you're working off of, your notes from the project kickoff meeting, status reports, vulnerability notifications, etc"
folder_descriptions["deliverables"]="Folder for keeping your deliverables as you work through them. This will often be your report but can include other items such as supplemental spreadsheets and slide decks, depending on the specific client requirements."
folder_descriptions["evidence/findings"]="We suggest creating a folder for each finding you plan to include in the report to keep your evidence for each finding in a container to make piecing the walkthrough together easier when you write the report."
folder_descriptions["evidence/scans/vulnerabilityScans"]="Export files from your vulnerability scanner (if applicable for the assessment type) for archiving."
folder_descriptions["evidence/scans/serviceEnumeration"]="Export files from tools you use to enumerate services in the target environment like Nmap, Masscan, Rumble, etc."
folder_descriptions["evidence/scans/web"]="Export files for tools such as ZAP or Burp state files, EyeWitness, Aquatone, etc."
folder_descriptions["evidence/scans/adEnumeration"]="JSON files from BloodHound, CSV files generated from PowerView or ADRecon, Ping Castle data, Snaffler log files, CrackMapExec logs, data from Impacket tools, etc."
folder_descriptions["evidence/notes"]="A folder to keep your notes in."
folder_descriptions["evidence/osint"]="Any OSINT output from tools like Intelx and Maltego that doesn't fit well in your notes document."
folder_descriptions["evidence/wireless"]="Optional if wireless testing is in scope, you can use this folder for output from wireless testing tools."
folder_descriptions["evidence/loggingOutput"]="Logging output from Tmux, Metasploit, and any other log output that does not fit the Scan subdirectories listed above."
folder_descriptions["evidence/miscFiles"]="Web shells, payloads, custom scripts, and any other files generated during the assessment that are relevant to the project."
folder_descriptions["retest"]="This is an optional folder if you need to return after the original assessment and retest the previously discovered findings. You may want to replicate the folder structure you used during the initial assessment in this directory to keep your retest evidence separate from your original evidence."

# Create the folders and generate .md files
for folder in "${!folder_descriptions[@]}"; do
    mkdir -p "${BASE_DIR}/${folder}"
    md_file="${BASE_DIR}/${folder}/info.md"
    
    # Write the content to the markdown file
    echo "# ${folder_descriptions["${folder}"]}" > "${md_file}"
    echo "created: $(date)" >> "${md_file}"
    echo "" >> "${md_file}"

done

tree "${BASE_DIR}"
echo "folder structure and markdown files created under: $(pwd)/${BASE_DIR}"
