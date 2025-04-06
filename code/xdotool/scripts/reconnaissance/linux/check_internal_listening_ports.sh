#!/bin/bash

: '
check internal listening ports
'

execute_command "netstat -tuplen"
create_new_line
