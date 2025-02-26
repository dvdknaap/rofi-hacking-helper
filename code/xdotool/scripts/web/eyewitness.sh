#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='eyewitness -f documentation/evidence/notes/subdomains -d documentation/evidence/scans/web/eyeWitness'
paste_command "${command}"
