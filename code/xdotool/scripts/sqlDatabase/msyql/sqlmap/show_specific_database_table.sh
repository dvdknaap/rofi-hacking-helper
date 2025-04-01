#!/bin/bash

: '
sqlmap: show specific database tables
'
# Generate GUI form items (label, type (optional: default text), name, default (optional))
URL_FIELD=$(form_item "URL" "url")
DATABASE_FIELD=$(form_item "database" "database")

# Generate GUI form
generate_form "${URL_FIELD}" "${DATABASE_FIELD}"

URL=${form_data["url"]}
DATABASE=${form_data["database"]}

execute_command "sqlmap -u ${URL} -D '${DATABASE}' --tables --random-agent --level 5 --risk 3 --batch"
create_new_line
