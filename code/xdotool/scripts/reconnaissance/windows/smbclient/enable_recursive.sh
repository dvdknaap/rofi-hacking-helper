#!/bin/bash

: '
smbclient: enable recursive
'

paste_command "RECURSE ON"
xdotool key Return
