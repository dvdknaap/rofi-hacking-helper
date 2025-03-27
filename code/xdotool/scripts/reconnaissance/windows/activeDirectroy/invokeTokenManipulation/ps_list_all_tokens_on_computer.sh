#!/bin/bash

: '
ps: Lists all tokens available on the computer.
'

paste_command "Invoke-TokenManipulation -ShowAll"
xdotool key Return
