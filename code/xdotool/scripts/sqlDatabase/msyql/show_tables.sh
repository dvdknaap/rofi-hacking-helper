#!/bin/bash

: '
mysql: show all available tables in the selected database
'

paste_command "show tables;"
xdotool key Return
