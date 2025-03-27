#!/bin/bash

: '
check internal listening ports
'

paste_command "netstat -ano | findstr LISTENING"
xdotool key Return
