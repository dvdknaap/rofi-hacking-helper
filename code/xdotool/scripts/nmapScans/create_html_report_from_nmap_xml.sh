#!/bin/bash

: '
Nmap: create html report from nmap xml report
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
NMAP_XML_FILE_FIELD=$(form_item  "namp xml file" "nmap_xml_file" "documentation/evidence/scans/serviceEnumeration/nmap.xml")
OUTPUT_FILE_FIELD=$(form_item  "output file" "output_file" "documentation/evidence/scans/serviceEnumeration/nmap.html")

# Generate GUI form
generate_form "${NMAP_XML_FILE_FIELD}" "${OUTPUT_FILE_FIELD}"

INMAP_XML_FILEP=${form_data["nmap_xml_file"]}
OUTPUT_FILE=${form_data["output_file"]}

paste_command "xsltproc ${INMAP_XML_FILEP} -o ${OUTPUT_FILE}"
xdotool key Return
sleep 0.8

paste_command "firefox ${OUTPUT_FILE}"
xdotool key Return
sleep 0.8
