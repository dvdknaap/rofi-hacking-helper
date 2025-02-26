#!/bin/bash

# Set base directory
BASEDIR=~/Desktop/base/code/xdotool

source "${BASEDIR}/helpers/paste_commands.sh"

function dir_menu {
    local DIR_LOCAL=$1

    # List content: Append `/` to directories for distinction
    local CHOICES=$(ls -p "${DIR_LOCAL}" --group-directories-first | grep -E ".*")

    # Get user choice from Rofi
    local SELECTION=$(echo -e "$CHOICES" | rofi -dmenu -theme "${BASEDIR}/theme/rofi-hacking-helper.rasi")

    if [ -n "$SELECTION" ]; then
        local FULL_PATH="${DIR_LOCAL}/${SELECTION}"

        # If directory, recursively enter it
        if [[ -d "$FULL_PATH" ]]; then
            dir_menu "$FULL_PATH"
            return 1

        # If file, execute
        elif [[ -f "$FULL_PATH" ]]; then
            case "$FULL_PATH" in
                *.sh)  bash "$FULL_PATH" ;;  # Execute shell scripts
                *.py)  python3 "$FULL_PATH" ;;  # Run Python scripts
                *.txt) xdg-open "$FULL_PATH" ;;  # Open text files
                *)     paste_command "Unknown file type: $FULL_PATH"; ;;  # Catch-all
            esac
            return 2
        fi
    fi
}

dir_menu "${BASEDIR}/scripts"
