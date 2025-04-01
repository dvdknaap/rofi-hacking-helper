#!/bin/bash

: '
get default credentials wordlist
'

execute_command "${SCRIPTS_DIR}/reconnaissance/defaultCreds/.files/userpass.txt"
create_new_line
