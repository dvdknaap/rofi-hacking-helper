#!/bin/bash

: '
fuzz SSTI fields in an attempt to break it
'

payload=$(cat "${SCRIPTS_DIR}/web/fuzzingInputs/.files/fuzzSstiPayload.txt")

execute_command "${payload}"
create_new_line
