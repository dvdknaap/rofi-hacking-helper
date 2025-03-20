#!/bin/bash

: '
show databases
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "SELECT name FROM master.dbo.sysdatabases"
xdotool key Return

