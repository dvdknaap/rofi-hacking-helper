#!/bin/bash

: '
Search for password in .txt,.ini, config, .db, .py files
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "findstr /si password *.txt *.ini *.config *.db *.py"