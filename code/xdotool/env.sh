#!/bin/bash

XDOTOOL_DIR="$(dirname "${BASH_SOURCE[0]}")"
HELPERS_DIR="${XDOTOOL_DIR}/helpers"
SCRIPTS_DIR="${XDOTOOL_DIR}/scripts"
DYNAMIC_FIELDS_DIR="${XDOTOOL_DIR}/dynamicFields"
SCREENSHOTS_DIR="${XDOTOOL_DIR}/screenshots"
SETTINGS_FILE="${XDOTOOL_DIR}/settings.sh"

declare -gA ACTIVE_CRED_SYSTEM

# Source all helper functions
for file in "${HELPERS_DIR}"/*.sh; do
  [ -f "${file}" ] || continue  # Skip if not a regular file
  source "${file}"
done

# Load dynamic fields
load_dynamic_fields

# Load default settings file
if [ -f "${SETTINGS_FILE}" ]; then
    source "${SETTINGS_FILE}"
fi

# show data in active cred system
# debug_active_cred_system

