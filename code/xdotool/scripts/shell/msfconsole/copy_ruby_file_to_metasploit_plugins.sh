#!/bin/bash

: '
copy ruby file to metasploit framework modules folder
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "file" "file" "9861.rb")
LOCATION_FIELD=$(form_item  "file" "location" "exploits/unix/webapp/nagios3_command_injection.rb")

# Generate GUI form
generate_form "${FILE_FIELD}" "${LOCATION_FIELD}" 

FILE=${form_data["file"]}
LOCATION=${form_data["location"]}

paste_command "cp ${FILE} /usr/share/metasploit-framework/modules/${LOCATION}"
xdotool key Return

