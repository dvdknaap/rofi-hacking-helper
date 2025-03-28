#!/bin/bash

: '
mysql: show all databases
'

paste_command "show databases;"
xdotool key Return
