#!/bin/bash

: '
fuzz sql fields in an attempt to break it
'

payload=$(cat "${SCRIPTS_DIR}/web/fuzzingInputs/.files/fuzzSqlPayload.txt")

execute_command "${payload}"
create_new_line
