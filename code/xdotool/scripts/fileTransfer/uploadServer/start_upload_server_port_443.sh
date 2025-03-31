#!/bin/bash

: '
start python upload server with port 433
'

paste_command "openssl req -x509 -out server.pem -keyout server.pem -newkey rsa:2048 -nodes -sha256 -subj '/CN=server'"
xdotool key Return
sleep 2

paste_command "python3 -m uploadserver  443 --server-certificate ~/server.pem"
xdotool key Return
