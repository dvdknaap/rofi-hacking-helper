#!/bin/bash

"""
meterpreter: set server routes
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "run autoroute -s 172.16.9.0/23"