#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='gobuster dir -u http://ip:port/ -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt -t 40 -b 400,404,403,429 -e -X /usr/share/wordlists/seclists/Discovery/Web-Content/web-extensions.txt'
paste_command "${command}"
