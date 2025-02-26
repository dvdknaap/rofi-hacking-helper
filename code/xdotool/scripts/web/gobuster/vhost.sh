#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='gobuster vhost -u http://soccer.htb -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -t 60 --append-domain -r --exclude-length 206'
paste_command "${command}"
