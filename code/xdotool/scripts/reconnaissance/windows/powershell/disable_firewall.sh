#!/bin/bash

: '
Disable firewall
'

execute_command "Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False"
create_new_line
