#!/bin/bash

: '
ps: Lists all unique usable tokens on the computer.
'

paste_command "Invoke-TokenManipulation -Enumerate"
xdotool key Return
