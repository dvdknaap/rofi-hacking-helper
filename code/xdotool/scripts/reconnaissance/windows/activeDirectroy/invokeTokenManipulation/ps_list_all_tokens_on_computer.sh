#!/bin/bash

: '
ps: Lists all tokens available on the computer.
'

execute_command "Invoke-TokenManipulation -ShowAll"
create_new_line
