#!/bin/bash

: '
execute eyewitness with nmap file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
NMAP_XML_FILE_FIELD=$(form_item "nmap xml file" "nmap_xml_file" "documentation/evidence/scans/serviceEnumeration/nmap.xml")
OUTPUT_FOLDER_FIELD=$(form_item "output folder" "output_folder" "documentation/evidence/scans/web/eyeWitness")

# Generate GUI form
generate_form "${NMAP_XML_FILE_FIELD}" "${OUTPUT_FOLDER_FIELD}"

NMAP_XML_FILE=${form_data["nmap_xml_file"]}
OUTPUT_FOLDER=${form_data["output_folder"]}

paste_command "eyewitness -x ${NMAP_XML_FILE} -d ${OUTPUT_FOLDER}"
xdotool key Return
