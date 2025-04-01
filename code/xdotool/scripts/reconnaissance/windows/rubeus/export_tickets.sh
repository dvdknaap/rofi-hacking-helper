#!/bin/bash

: '
Rubeus: export tickets
'

execute_command "Rubeus.exe dump /nowrap"
create_new_line
