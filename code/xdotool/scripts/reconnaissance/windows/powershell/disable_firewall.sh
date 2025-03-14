#!/bin/bash

: '
Disable firewall
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False"