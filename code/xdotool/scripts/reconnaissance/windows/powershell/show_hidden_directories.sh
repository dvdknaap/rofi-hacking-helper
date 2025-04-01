#!/bin/bash

: '
Powershell: show hidden directories
'

execute_command "Get-ChildItem -Directory -Recurse -Hidden -ErrorAction SilentlyContinue"
create_new_line
