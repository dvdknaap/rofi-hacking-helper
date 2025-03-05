#!/bin/bash

"""
Check user permissions and other usefull pentest info
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='printf "id:\n";id; printf "\ncat /etc/passwd:\n";cat /etc/passwd | grep /home/; printf "\nls -alF:\n";ls -alF; printf "\ncat /etc/*-release:\n";cat /etc/*-release;  printf "\nsudo -V:\n";sudo -V | head -n1; printf "\nuname -r:\n"; uname -r; printf "\nsudo -l:\n";sudo -l'
paste_command "${command}"
