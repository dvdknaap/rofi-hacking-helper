#!/bin/bash

"""
Net: Check local administrators
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "net localgroup administrators"
xdotool key Return
