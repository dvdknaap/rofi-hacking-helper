#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='feroxbuster -u 'http://bounty.htb' -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x @/usr/share/wordlists/seclists/Discovery/Web-Content/web-extensions.txt -C 400,404,403,429'
paste_command "${command}"
