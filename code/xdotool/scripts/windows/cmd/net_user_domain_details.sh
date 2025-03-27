#!/bin/bash

: '
Net: Get domain user information for hporter.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "net user hporter /dom"