#!/bin/bash

: '
powerview: show ad users in group
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
GROUP_NAME_FIELD=$(form_item  "group name" "group_name")

# Generate GUI form
generate_form "${GROUP_NAME_FIELD}"

GROUP_NAME=${form_data["group_name"]}

execute_command "Get-DomainGroupMember -Identity '${GROUP_NAME}' | select MemberName"
create_new_line

