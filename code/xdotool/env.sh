#!/bin/bash

XDOTOOL_DIR="$(dirname "${BASH_SOURCE[0]}")"
HELPER_DIR="${XDOTOOL_DIR}/helpers"
SCRIPTS_DIR="${XDOTOOL_DIR}/scripts"

declare -gA ACTIVE_CRED_SYSTEM

# Pretending that this is created by the cred system
# ACTIVE_CRED_SYSTEM["username"]="raven"
# ACTIVE_CRED_SYSTEM["domain"]="manager.htb"
# ACTIVE_CRED_SYSTEM["password"]="R4v3nBe5tD3veloP3r!123"
# ACTIVE_CRED_SYSTEM["ip"]="10.129.211.168"
# ACTIVE_CRED_SYSTEM["ca_name"]="manager-DC01-CA"
# ACTIVE_CRED_SYSTEM["officer_name"]="raven"
# ACTIVE_CRED_SYSTEM["template"]="SubCA"
# ACTIVE_CRED_SYSTEM["request_id"]="26"
# ACTIVE_CRED_SYSTEM["pfx_file"]="administrator.pfx"
# ACTIVE_CRED_SYSTEM["upn_user"]="administrator@manager.htb"

# Source all helper functies
for file in "${HELPER_DIR}"/*.sh; do
  [ -f "$file" ] || continue  # Skip if not a regular file
  source "$file"
done
