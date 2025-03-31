#!/bin/bash

: '
Get tasklist
'

paste_command "tasklist /svc"
xdotool key Return
