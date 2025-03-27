#!/bin/bash

: '
Start Neo4j service and launch BloodHound GUI.
'

paste_command "sudo neo4j start && bloodhound"
xdotool key Return
