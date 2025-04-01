#!/bin/bash

: '
mysql: show all available tables in the selected database
'

execute_command "show tables;"
create_new_line
