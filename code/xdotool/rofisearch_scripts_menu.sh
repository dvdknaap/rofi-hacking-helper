#!/bin/bash

# Set base directory
BASEDIR=~/Desktop/base/code/xdotool
XDOTOOL_DIR=~/Desktop/base/code/xdotool
SCRIPTS_DIR="${XDOTOOL_DIR}/scripts"
CACHE_DIR="${XDOTOOL_DIR}/var/cache"
UPDATE_CHECK_FILE="${CACHE_DIR}/.rofi_last_update_check"

source "${XDOTOOL_DIR}/helpers/paste_commands.sh"

mkdir -p "$CACHE_DIR"

# Check for updates from git (once per day)
function check_for_updates {
    local NOW=$(date +%s)
    local LAST_CHECK=0
    if [[ -f "$UPDATE_CHECK_FILE" ]]; then
        LAST_CHECK=$(cat "$UPDATE_CHECK_FILE")
    fi

    if (( NOW - LAST_CHECK > 86400 )); then
        if [[ -d "$BASEDIR/.git" ]]; then
            cd "$BASEDIR"
            git fetch origin &>/dev/null
            LOCAL=$(git rev-parse HEAD)
            REMOTE=$(git rev-parse origin/main)

            if [[ "$LOCAL" != "$REMOTE" ]]; then
                rofi -theme-str 'window {width: 300px;}' -e "Update available! Pull changes?"
                if [[ $? -eq 0 ]]; then
                    git pull origin main
                    echo "Update complete!"
                else
                    echo "$NOW" > "$UPDATE_CHECK_FILE"
                fi
            fi
        fi
    fi
}

# Cache directory listing per folder
function generate_cache {
    local DIR_LOCAL=$1
    local CACHE_FILE="${CACHE_DIR}/$(echo -n "$DIR_LOCAL" | md5sum | awk '{print $1}').cache"

    {
        find "$DIR_LOCAL" -maxdepth 1 -mindepth 1 -type d ! -name ".*" -printf "%f/\n" | sort
        find "$DIR_LOCAL" -maxdepth 1 -mindepth 1 -type f ! -name ".*" -printf "%f\n" | sort
    } > "$CACHE_FILE"
}

# Use cached menu if available
function get_cached_menu {
    local DIR_LOCAL=$1
    local CACHE_FILE="${CACHE_DIR}/$(echo -n "$DIR_LOCAL" | md5sum | awk '{print $1}').cache"

    if [[ ! -f "$CACHE_FILE" || $(find "$DIR_LOCAL" -newer "$CACHE_FILE" | wc -l) -gt 0 ]]; then
        generate_cache "$DIR_LOCAL"
    fi
    cat "$CACHE_FILE"
}

function dir_menu {
    local DIR_LOCAL=$1

    if [[ "$DIR_LOCAL" != "$SCRIPTS_DIR" ]]; then
        CHOICES=".. (Go Back)\n$(get_cached_menu "$DIR_LOCAL")"
    else
        CHOICES="$(get_cached_menu "$DIR_LOCAL")"
    fi

    local SELECTION=$(echo -e "$CHOICES" | rofi -dmenu -theme "${XDOTOOL_DIR}/theme/rofi-hacking-helper.rasi")

    if [ -n "$SELECTION" ]; then
        local FULL_PATH="${DIR_LOCAL}/${SELECTION}"

        if [[ "$SELECTION" == ".. (Go Back)" ]]; then
            local PARENT_DIR=$(dirname "$DIR_LOCAL")
            if [[ "$PARENT_DIR" == "$XDOTOOL_DIR" ]]; then
                dir_menu "$SCRIPTS_DIR"
            else
                dir_menu "$PARENT_DIR"
            fi
        elif [[ -d "$FULL_PATH" ]]; then
            dir_menu "$FULL_PATH"
        elif [[ -f "$FULL_PATH" ]]; then
            case "$FULL_PATH" in
                *.sh)  bash "$FULL_PATH" ;;  
                *.py)  python3 "$FULL_PATH" ;;  
                *.txt) xdg-open "$FULL_PATH" ;;  
                *)     paste_command "Unknown file type: $FULL_PATH"; ;;  
            esac
        fi
    fi
}

check_for_updates
dir_menu "$SCRIPTS_DIR"
