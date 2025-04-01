#!/bin/bash

: '
Net: Check local administrators
'

execute_command "net localgroup administrators"
create_new_line
