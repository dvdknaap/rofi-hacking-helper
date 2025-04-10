#!/bin/bash

: '
fuzz input fields in an attempt to break it
'

payload=$(cat "${SCRIPTS_DIR}/web/fuzzingInputs/.files/fuzzInputPayload.txt")

execute_command "${payload}"
create_new_line
