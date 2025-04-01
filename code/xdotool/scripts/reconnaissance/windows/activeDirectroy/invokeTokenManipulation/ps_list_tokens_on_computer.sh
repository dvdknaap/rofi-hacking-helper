#!/bin/bash

: '
ps: Lists all unique usable tokens on the computer.
'

execute_command "Invoke-TokenManipulation -Enumerate"
create_new_line
