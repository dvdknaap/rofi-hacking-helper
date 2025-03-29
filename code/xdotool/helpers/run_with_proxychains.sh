#!/bin/bash

function run_with_proxychains {
    local SCRIPT_PATH="$1"

    if [[ -z "$1" ]]; then
        paste_command "Usage: run_with_proxychains <script path>"
        exit 1
    fi

    # Check if the script is in the proxychains folder
    if [[ "${SCRIPT_PATH}" == *"/proxychains/"* ]]; then
        # Remove 'proxychains/' from the path
        local ORIGINAL_SCRIPT="${SCRIPT_PATH/\/proxychains\//\/}"

        paste_command "proxychains "
        source "$ORIGINAL_SCRIPT"
    else
        paste_command "Error: Script is not in a proxychains folder: ${SCRIPT_PATH}."
        exit 1
    fi
}
