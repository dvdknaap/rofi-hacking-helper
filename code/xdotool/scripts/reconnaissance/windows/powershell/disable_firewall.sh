#!/bin/bash

: '
Disable firewall
'

paste_command "Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False"
xdotool key Return
