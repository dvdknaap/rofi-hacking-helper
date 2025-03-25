#!/bin/bash

: '
show databases
'

paste_command "SELECT name FROM master.dbo.sysdatabases"
xdotool key Return