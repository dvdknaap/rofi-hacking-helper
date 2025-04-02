#!/bin/bash

: '
get SSH key
'

SSH_KEY=$(cat ~/.ssh/id_*.pub | tr -d '\n')

execute_command "${SSH_KEY}"
