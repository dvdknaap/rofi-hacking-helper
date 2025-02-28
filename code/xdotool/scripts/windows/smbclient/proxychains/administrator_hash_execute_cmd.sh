#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "proxychains smbclient -U ssmalls '//172.16.8.3/Department Shares'"

