#!/bin/bash

: '
show available formats
'

PROGRAM_PATH="${SCRIPTS_DIR}/reconnaissance/username-anarchy/.files/username-anarchy"

execute_command "${PROGRAM_PATH} --list-formats"
create_new_line
