#!/bin/bash

: '
Search for password in .txt,.ini, config, .db, .py files
'

paste_command "findstr /si password *.txt *.ini *.config *.db *.py"
xdotool key Return
