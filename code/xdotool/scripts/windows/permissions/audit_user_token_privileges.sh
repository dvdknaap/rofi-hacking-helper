#!/bin/bash

"""
SharpUp - audit token privileges.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "SharpUp.exe audit TokenPrivileges"
