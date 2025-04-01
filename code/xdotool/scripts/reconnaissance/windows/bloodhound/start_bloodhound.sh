#!/bin/bash

: '
Start Neo4j service and launch BloodHound GUI.
'

execute_command "sudo neo4j start && bloodhound"
create_new_line
