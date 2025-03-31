#!/bin/bash

: '
awk - get interactive shell
'

paste_command "awk 'BEGIN {system(\"/bin/sh\")}'"
xdotool key Return
