#!/bin/bash

: '
start a ftp server
'

execute_command "python3 -m pyftpdlib --port 21"
create_new_line
