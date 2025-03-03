#!/bin/bash

"""
Read contents of C:\Users\Administrator\Desktop\proof.txt.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "type C:\\Users\\Administrator\\Desktop\\proof.txt"
xdotool key Return
