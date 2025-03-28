#!/bin/bash

: '
sqlmap: dump current database
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
URL_FIELD=$(form_item "URL" "url")

# Generate GUI form
generate_form "${URL_FIELD}"

URL=${form_data["url"]}

paste_command "sqlmap -u ${URL} --dump --random-agent --level 5 --risk 3 --batch"
xdotool key Return
