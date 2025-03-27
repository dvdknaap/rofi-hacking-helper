#!/bin/bash

: '
smbclient: turn off prompt
'

paste_command "PROMPT OFF"
xdotool key Return
