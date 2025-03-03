#!/bin/bash

"""
nxc rdp: Check RDP with user/pass.
"""


source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "netexec rdp 172.16.8.3 -u 'user' -p 'pass'"