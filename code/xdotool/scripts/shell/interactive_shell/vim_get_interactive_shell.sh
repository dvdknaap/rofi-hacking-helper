#!/bin/bash

: '
vim - get interactive shell
'

paste_command "vim"
xdotool key Return
sleep 0.8

paste_command ":set shell=/bin/sh"
xdotool key Return
sleep 0.8

paste_command ":shell"
xdotool key Return
sleep 0.8
