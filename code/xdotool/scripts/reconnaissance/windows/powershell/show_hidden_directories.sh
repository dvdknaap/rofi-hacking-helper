#!/bin/bash

: '
Powershell: show hidden directories
'

paste_command "Get-ChildItem -Directory -Recurse -Hidden -ErrorAction SilentlyContinue"
xdotool key Return
