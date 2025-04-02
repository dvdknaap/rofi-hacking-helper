
# Set base directory
REAL_PATH="$(realpath "${BASH_SOURCE[0]}")"
ROOT_DIR="$(realpath "$(dirname "${REAL_PATH}")/../../")"
XDOTOOL_DIR="${ROOT_DIR}/code/xdotool"
SCRIPTS_DIR="${XDOTOOL_DIR}/scripts"
CACHE_DIR="${XDOTOOL_DIR}/var/cache"
UPDATE_CHECK_FILE="${CACHE_DIR}/.rofi_last_update_check"

mkdir -p "${CACHE_DIR}"

# Get the directory of the current script
python_script="${XDOTOOL_DIR}/scriptSearcher.py"

# Check for updates from git (once per day)
function check_for_updates {
    local NOW=$(date +%s)
    local LAST_CHECK=0
    if [[ -f "$UPDATE_CHECK_FILE" ]]; then
        LAST_CHECK=$(cat "$UPDATE_CHECK_FILE")
    fi

    if (( NOW - LAST_CHECK > 86400 )); then
        if [[ -d "${ROOT_DIR}/.git" ]]; then
            cd "${ROOT_DIR}"
            git fetch origin &>/dev/null
            LOCAL=$(git rev-parse HEAD)
            REMOTE=$(git rev-parse origin/main)

            if [[ "$LOCAL" != "$REMOTE" ]]; then
                local CHOICE=$(echo -e "Yes\nNo" | rofi -dmenu -theme "${XDOTOOL_DIR}/theme/rofi-hacking-helper-update.rasi")

                if [[ "$CHOICE" == "Yes" ]]; then
                    bash update.sh
                fi
            fi

            echo "${NOW}" > "${UPDATE_CHECK_FILE}"
        fi
    fi
}

function execute_script() {
    # Call the Python script and capture the output
    script_path=$(python3 "${python_script}" 2>/dev/null)

    if [ $? -ne 0 ]; then
        paste_command "# Error: Failed to execute: python3 ${python_script}"
        create_new_line

        paste_command "# ${script_path}"
        create_new_line
        exit 1
    fi

    FULL_PATH="${SCRIPTS_DIR}/${script_path}"

    # form is closed by ctrl+c or esc
    if [[ "${script_path}" == "" ]]; then
        exit 0
    fi

    # check if not file exists
    if [ ! -f "${FULL_PATH}" ]; then
        paste_command "# This script doesn't exists"
        create_new_line
        exit 1
    fi

    # execute script based on extension
    case "${FULL_PATH}" in
        *.sh)  bash -c "source ${XDOTOOL_DIR}/env.sh ${FULL_PATH} && source ${FULL_PATH}" ;;
        *.py)  python3 "${FULL_PATH}"  ;;
        *.pl)  perl "${FULL_PATH}"  ;;
        *)     paste_command "Unknown file type: ${FULL_PATH}"; ;;
    esac

    exit 0
}

execute_script
