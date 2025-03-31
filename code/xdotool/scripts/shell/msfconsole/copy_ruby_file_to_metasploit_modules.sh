#!/bin/bash

: '
copy ruby file to metasploit framework plugins folder
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "file" "file" "pentest.rb9861.rb")
LOCATION_FIELD=$(form_item  "file" "location" "pentest.rb")

# Generate GUI form
generate_form "${FILE_FIELD}" "${LOCATION_FIELD}" 

FILE=${form_data["file"]}
LOCATION=${form_data["location"]}

paste_command "cp ${FILE} /usr/share/metasploit-framework/plugins/${LOCATION}"
xdotool key Return

