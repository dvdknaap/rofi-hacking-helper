#!/bin/bash

"""
Net: Show connected network drives.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "net use"
xdotool key Return
