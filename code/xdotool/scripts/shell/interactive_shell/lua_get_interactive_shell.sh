#!/bin/bash

: '
lua - get interactive shell
'

paste_command "lua: os.execute('/bin/sh')"
xdotool key Return
