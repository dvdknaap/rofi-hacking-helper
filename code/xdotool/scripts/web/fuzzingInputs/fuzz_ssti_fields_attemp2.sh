#!/bin/bash

: '
fuzz SSTI fields in an attempt to break it (attemp 2)
'

payload=$(cat "${SCRIPTS_DIR}/web/fuzzingInputs/.files/fuzzSstiPayloadAttemp2.txt")

execute_command "${payload}"
create_new_line
