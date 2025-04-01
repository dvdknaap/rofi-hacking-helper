#!/bin/bash

: '
start a smb server and create share location if not exists
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SHARE_FIELD=$(form_item "share name" "share")
SMB_SHARE_LOCATION_FIELD=$(form_item "smb share location" "smb_share_location" "./smbshare")

# Generate GUI form
generate_form "${SHARE_FIELD}" "${SMB_SHARE_LOCATION_FIELD}" 

SHARE=${form_data["share"]}
SMB_SHARE_LOCATION=${form_data["smb_share_location"]}

if [ -d "${SMB_SHARE_LOCATION}" ]; then
  mkdir ${SMB_SHARE_LOCATION}
fi

execute_command "sudo impacket-smbserver ${SHARE} -smb2support ${SMB_SHARE_LOCATION}"
create_new_line
