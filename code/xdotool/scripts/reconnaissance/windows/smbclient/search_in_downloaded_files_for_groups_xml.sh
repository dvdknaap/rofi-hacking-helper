#!/bin/bash

: '
search for group policies in downloaded folders
'

execute_command "find . -iname Groups.xml 2> /dev/null"
create_new_line
