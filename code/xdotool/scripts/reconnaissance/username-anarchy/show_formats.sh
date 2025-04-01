#!/bin/bash

: '
show available formats
'

PROGRAM_PATH="${SCRIPTS_DIR}/reconnaissance/username-anarchy/.files/username-anarchy"

paste_command "${PROGRAM_PATH} --list-formats"
xdotool key Return
