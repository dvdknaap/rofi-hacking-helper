#!/bin/bash

: '
vim - get interactive shell
'

execute_command "vim"
create_new_line
sleep 0.8

execute_command ":set shell=/bin/sh"
create_new_line
sleep 0.8

execute_command ":shell"
create_new_line
sleep 0.8
