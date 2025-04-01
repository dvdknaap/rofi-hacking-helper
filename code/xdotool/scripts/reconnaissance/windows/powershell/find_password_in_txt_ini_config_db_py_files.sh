#!/bin/bash

: '
Search for password in .txt,.ini, config, .db, .py files
'

execute_command "findstr /si password *.txt *.ini *.config *.db *.py"
create_new_line
