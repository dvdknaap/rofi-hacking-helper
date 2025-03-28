#!/bin/bash

: '
start python upload server
'

paste_command "python3 -m uploadserver"
xdotool key Return
