#!/bin/bash

: '
sqlmap: show all databases
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
URL_FIELD=$(form_item "URL" "url")

# Generate GUI form
generate_form "${URL_FIELD}"

URL=${form_data["url"]}

execute_command "sqlmap -u ${URL} --dbs --random-agent --level 5 --risk 3 --batch"
create_new_line
