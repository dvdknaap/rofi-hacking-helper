#!/bin/bash

"""
Read contents of C:\Users\Administrator\Desktop\root.txt.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "type C:\\Users\\Administrator\\Desktop\\root.txt"
xdotool key Return
