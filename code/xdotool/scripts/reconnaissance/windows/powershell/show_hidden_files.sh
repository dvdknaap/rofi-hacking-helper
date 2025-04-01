#!/bin/bash

: '
Powershell: show hidden files
'

execute_command "Get-ChildItem -File -Recurse -Hidden -ErrorAction SilentlyContinue"
create_new_line
