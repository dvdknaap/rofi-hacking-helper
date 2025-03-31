#!/bin/bash

: '
start python upload server with port 80
'

paste_command "python3 -m uploadserver"
xdotool key Return
