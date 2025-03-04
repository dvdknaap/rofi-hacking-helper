#!/bin/bash

"""
PowerShell: Get users with non-null descriptions.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command 'Get-DomainUser * |select samaccountname,description | ?{$_.Description -ne $null}'
xdotool key Return