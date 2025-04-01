#!/bin/bash

: '
show databases
'

execute_command "SELECT name FROM master.dbo.sysdatabases"
create_new_line
