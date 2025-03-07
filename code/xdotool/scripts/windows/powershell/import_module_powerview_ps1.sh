#!/bin/bash

: '
PowerShell: Import PowerView module.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command="Import-Module .\PowerView.ps1"
paste_command "${command}"
