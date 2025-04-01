#!/bin/bash

: '
start python upload server with port 433
'

execute_command "openssl req -x509 -out server.pem -keyout server.pem -newkey rsa:2048 -nodes -sha256 -subj '/CN=server'"
create_new_line
sleep 2

execute_command "python3 -m uploadserver  443 --server-certificate ~/server.pem"
create_new_line
