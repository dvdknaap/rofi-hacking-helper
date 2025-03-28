#!/bin/bash

: '
start a ftp server
'

paste_command "python3 -m pyftpdlib --port 21"
xdotool key Return
