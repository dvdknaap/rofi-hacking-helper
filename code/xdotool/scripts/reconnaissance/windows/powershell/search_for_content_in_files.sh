#!/bin/bash

: '
Powershell: search for content in string
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PATH_FIELD=$(form_item  "path" "path" "c:\Users")
SEARCH_STRING_FIELD=$(form_item  "search string" "search_string")

# Generate GUI form
generate_form "${PATH_FIELD}" "${SEARCH_STRING_FIELD}"

PATH=${form_data["path"]}
SEARCH_STRING=${form_data["search_string"]}

execute_command "Get-ChildItem -Recurse -ErrorAction SilentlyContinue -File -Force -Path ${PATH} | Select-String "${SEARCH_STRING}" -List"
create_new_line
