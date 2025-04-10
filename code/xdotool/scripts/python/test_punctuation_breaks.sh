#!/bin/bash

: '
python3: check which punctuation breaks the website
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
URL_FIELD=$(form_item  "url" "url" "http://127.0.0.1:3000/")
METHOD_FIELD=$(form_item  "method" "method" "get")
COOKIE_FIELD=$(form_item  "cookie string" "cookie")
PARAMS_FIELD=$(form_item  "url param string or json" "params")
TEST_PARAM_FIELD=$(form_item  "test param in request" "test_param" "search")
OUTPUT_INVALID_STRING_FIELD=$(form_item  "output invalid string" "result_invalid_string")

# Generate GUI form
generate_form "${URL_FIELD}" "${METHOD_FIELD}" "${COOKIE_FIELD}"  "${PARAMS_FIELD}" "${TEST_PARAM_FIELD}" "${OUTPUT_INVALID_STRING_FIELD}"

URL=${form_data["url"]}
METHOD=${form_data["method"]}
COOKIE=${form_data["cookie"]}
PARAMS=${form_data["params"]}
TEST_PARAM=${form_data["test_param"]}
OUTPUT_INVALID_STRING=${form_data["result_invalid_string"]}

execute_command "python3 ${SCRIPTS_DIR}/python/.files/pythonTestPunctuationBreaks.py --url '${URL}' --method '${METHOD}' --cookie '${COOKIE}' --params '${PARAMS}' --test-param '${TEST_PARAM}' --invalid-text '${OUTPUT_INVALID_STRING}'"
create_new_line
