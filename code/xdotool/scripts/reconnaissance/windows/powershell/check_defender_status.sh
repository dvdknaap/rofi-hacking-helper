#!/bin/bash

: '
check defender status
'

paste_command "Get-MpComputerStatus"
xdotool key Return
