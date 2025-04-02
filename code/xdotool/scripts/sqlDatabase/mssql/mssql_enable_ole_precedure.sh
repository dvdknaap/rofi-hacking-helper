#!/bin/bash

: '
mssql: enable Ole Automation procedure
'

execute_command "sp_configure 'show advanced options', 1"
create_new_line
sleep 0.8

execute_command "RECONFIGURE"
create_new_line
sleep 0.8

execute_command "sp_configure 'Ole Automation Procedures', 1"
create_new_line
sleep 0.8

execute_command "RECONFIGURE"
create_new_line
sleep 0.8
