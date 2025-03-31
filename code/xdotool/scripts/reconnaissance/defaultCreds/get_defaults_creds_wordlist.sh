#!/bin/bash

: '
get default credentials wordlist
'

paste_command "${SCRIPTS_DIR}/reconnaissance/defaultCreds/.files/userpass.txt"
xdotool key Return
