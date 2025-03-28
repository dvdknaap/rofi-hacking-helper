#!/bin/bash

: '
rpcclient: brute Forcing User RIDs
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

paste_command "for i in \$(seq 500 1100);do rpcclient -N -U \"\" ${IP} -c "queryuser 0x\$(printf '%x\n' \$i)" | grep \"User Name\|user_rid\|group_rid\" && echo \"\";done"
xdotool key Return
