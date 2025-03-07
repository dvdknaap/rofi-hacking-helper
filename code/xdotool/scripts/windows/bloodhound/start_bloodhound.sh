#!/bin/bash

: '
Start Neo4j service and launch BloodHound GUI.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "sudo neo4j start"
xdotool key Return

sleep 1.5

paste_command "bloodhound"
xdotool key Return
