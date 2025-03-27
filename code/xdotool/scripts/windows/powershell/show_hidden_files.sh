#!/bin/bash

: '
Powershell: show hidden files
'

paste_command "Get-ChildItem -File -Recurse -Hidden -ErrorAction SilentlyContinue"
xdotool key Return
