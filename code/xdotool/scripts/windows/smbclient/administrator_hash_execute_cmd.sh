#!/bin/bash

"""
smbclient: Connect to share.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "smbclient -U ssmalls '//172.16.8.3/Department Shares'"

