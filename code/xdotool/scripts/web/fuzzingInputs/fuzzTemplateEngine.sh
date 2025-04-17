#!/bin/bash

: '
fuzz input field to find template engine with request file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
REQUEST_FILE_FIELD=$(form_item "request file" "request_file")
TEST_PARAM_FIELD=$(form_item "test param" "test_param")
FORCE_HTTPS_FIELD=$(form_item "force https" "select" "force_https" "no" "yes|no")

# Generate GUI form
generate_form "${REQUEST_FILE_FIELD}" "${TEST_PARAM_FIELD}" "${FORCE_HTTPS_FIELD}"

REQUEST_FILE=${form_data["request_file"]}
TEST_PARAM=${form_data["test_param"]}
FORCE_HTTPS=${form_data["force_https"]}

force_https_switch=""
if [[ "${FORCE_HTTPS}" == "yes" ]]; then
    force_https_switch=' --https'
fi

execute_command "python3 ${SCRIPT_DIR}/web/fuzzingInputs/.files/fuzzTemplateEngine.py -f ${REQUEST_FILE} --test-param '${TEST_PARAM}'${force_https_switch} -v"
create_new_line
