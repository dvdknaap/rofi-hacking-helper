#!/bin/bash

: '
execute eyewitness with nmap file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "eyewitness -x documentation/evidence/scans/serviceEnumeration/nmap.xml -d documentation/evidence/scans/web/eyeWitness"
