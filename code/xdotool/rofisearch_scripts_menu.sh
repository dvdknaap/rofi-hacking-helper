#!/bin/bash

# Set base directory
REAL_PATH="$(realpath "$0")"
ROOT_DIR="$(dirname "${REAL_PATH}")"
XDOTOOL_DIR="${ROOT_DIR}/code/xdotool"
SCRIPTS_DIR="${XDOTOOL_DIR}/scripts"
CACHE_DIR="${XDOTOOL_DIR}/var/cache"
UPDATE_CHECK_FILE="${CACHE_DIR}/.rofi_last_update_check"

mkdir -p "${CACHE_DIR}"

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

# Function to get description
function get_description {
    local file=$1
    local description=""

    # Check if it's a file
    if [[ -f "${file}" ]]; then
        # If the file is inside a 'proxychains' directory, get description from the parent directory
        if [[ "${file}" == *"/proxychains"* ]]; then
            # Remove 'proxychains/' from the path to get the parent directory
            local parent_file=$(echo "${file}" | sed 's/\/proxychains//')

            # Get the description from the parent directory's .desc file
            if [[ -f "${parent_file}" ]]; then
                # For files outside 'proxychains', get description from the file itself (comments)
                description="proxychains: $(sed -n "/^: '\$/,/^'\$/{//!p}" "${parent_file}")"
            fi
        else
            # For files outside 'proxychains', get description from the file itself (comments)
            description=$(sed -n "/^: '\$/,/^'\$/{//!p}" "${file}")
        fi
    # Check if it's a directory
    elif [[ -d "${file}" ]]; then

        # If the directory is inside 'proxychains', get description from the parent directory's .desc file
        if [[ "${file}" == *"/proxychains"* ]]; then
            local parent_dir=$(echo "${file}" | sed 's/\/proxychains//')
            local parent_desc="${parent_dir}/.desc"

            if [[ -f "${parent_desc}" ]]; then
                description="proxychains: $(cat "${parent_desc}")"
            fi
        elif [[ -f "${file}/.desc" ]]; then
            # Otherwise, get the description from the .desc file in the directory
            description=$(cat "${file}/.desc")
        fi
    fi

    echo "${description}"
}

# Function to format file name for search functionality
function clean_filename {
    local name=$1
    echo "${name}" | tr '_-' ' ' | tr '[:upper:]' '[:lower:]'
}

# Function to assign icons to files/folders
function get_icon {
    local file=$1
    if [[ -d "${file}" ]]; then
        echo "📂"
    elif [[ "${file}" == *.sh ]]; then
        echo "📜"
    elif [[ "${file}" == *.py ]]; then
        echo "🐍"
    elif [[ "${file}" == *.pl ]]; then
        echo "🐪"
    else
        echo "🪲"
    fi
}

# Cache directory listing with descriptions and icons
function generate_cache {
    local DIR_LOCAL=$1
    local CACHE_FILE="${CACHE_DIR}/$(echo -n "${DIR_LOCAL}" | md5sum | awk '{print $1}').cache"

    rm -f "${CACHE_FILE}"

    # Eerste: Voeg 'dynamicFields' toe als het in de rootmap staat
    if [[ "$DIR_LOCAL" == "$SCRIPTS_DIR" && -d "${DIR_LOCAL}/dynamicFields" ]]; then
        local name="dynamicFields"
        local description=$(get_description "${DIR_LOCAL}/${name}")
        local search_name=$(clean_filename "${name}")
        local icon=$(get_icon "${DIR_LOCAL}/${name}")

        echo -e "$icon $name | $description | $search_name" >> "${CACHE_FILE}"
    fi

    # First collect directories
    while IFS= read -r dir; do
        local name=$(basename "$dir")
        local description=$(get_description "${dir}")
        local search_name=$(clean_filename "${name}")
        local icon=$(get_icon "$dir")

        if [[ "${name}" == "dynamicFields" ]]; then
            continue
        fi

        echo -e "$icon $name | $description | $search_name" >> "${CACHE_FILE}"
    done < <(find "$DIR_LOCAL" -mindepth 1 -maxdepth 1 -type d ! -name ".*" | sort)

    # Then collect files
    while IFS= read -r file; do
        local name=$(basename "${file}")
        local description=$(get_description "${file}")
        local search_name=$(clean_filename "${name}")
        local icon=$(get_icon "${file}")

        echo -e "$icon $name | $description | $search_name" >> "${CACHE_FILE}"
    done < <(find "$DIR_LOCAL" -mindepth 1 -maxdepth 1 -type f,l ! -name ".*" | sort)
}

# Use cache if available
function get_cached_menu {
    local DIR_LOCAL=$1
    local CACHE_FILE="${CACHE_DIR}/$(echo -n "${DIR_LOCAL}" | md5sum | awk '{print $1}').cache"

    if [[ ! -f "${CACHE_FILE}" || $(find "${DIR_LOCAL}" -newer "${CACHE_FILE}" | wc -l) -gt 0 ]]; then
        generate_cache "${DIR_LOCAL}"
    fi

    cat "${CACHE_FILE}"
}

# Smart search in Rofi
function fuzzy_search {
    local input="$1"
    local DIR_LOCAL="$2"
    local results=""

    # Convert input to lowercase
    local input_lower=$(echo "${input}" | tr '[:upper:]' '[:lower:]')

    while IFS=$'\n' read -r line; do
        local icon=$(echo "${line}" | cut -d' ' -f1)
        local name=$(echo "${line}" | cut -d'|' -f1 | cut -d' ' -f2-)
        local desc=$(echo "${line}" | cut -d'|' -f2 | sed 's/^[[:space:]]*//; s/^[[:space:]]*$//')
        local search=$(echo "${line}" | cut -d'|' -f3 | sed 's/^[[:space:]]*$//; s/^[[:space:]]*$//')

        # Convert search, name, and desc to lowercase
        local search_lower=$(echo "${search}" | tr '[:upper:]' '[:lower:]')
        local name_lower=$(echo "${name}" | tr '[:upper:]' '[:lower:]')
        local desc_lower=$(echo "${desc}" | tr '[:upper:]' '[:lower:]')

        # Simplified matching: check if input is a substring of any of the fields
        if [[ -z "${input}" || "${search_lower}${name_lower}${desc_lower}" == *"${input_lower}"* ]]; then
            local result="${icon} ${name}"

            # Add description if it's not empty
            if [[ -n "$desc" ]]; then
                result+=" | ${desc}"
            fi
            result+="\n"

            results+="${result}"
        fi
    done < <(get_cached_menu "${DIR_LOCAL}")

    echo -e "$results"
}

function dir_menu {
    local DIR_LOCAL="$1"
    local search_query=""

    while true; do
        if [[ "${DIR_LOCAL}" != "${SCRIPTS_DIR}" ]]; then
            local current_folder=$(basename "${DIR_LOCAL}")
            menu_items="Current folder: 📂 "${current_folder}"  \n🔙 .. (Go Back)\n$(fuzzy_search  "${search_query}" "${DIR_LOCAL}")"
        else
            menu_items="$(fuzzy_search  "${search_query}" "${DIR_LOCAL}")"
        fi

        local SELECTION=$(echo -e "${menu_items}" | rofi -dmenu -theme "${XDOTOOL_DIR}/theme/rofi-hacking-helper.rasi" -p "Search: ${search_query}")

        # Rofi exit?
        if [[ -z "${SELECTION}" ]]; then
            exit 0
        fi

        local ICON=$(echo "${SELECTION}" | cut -d' ' -f1) # Extract icon
        local NAME=$(echo "${SELECTION}" | cut -d'|' -f1 | cut -d' ' -f2- | awk '{$1=$1};1') # Extract name correctly
        local FULL_PATH="${DIR_LOCAL}/${NAME}"

        if [[ "${NAME}" == ".. (Go Back)" ]]; then
            local PARENT_DIR=$(dirname "${DIR_LOCAL}")
            if [[ "${PARENT_DIR}" == "${XDOTOOL_DIR}" ]]; then
                dir_menu "${SCRIPTS_DIR}"
            else
                dir_menu "${PARENT_DIR}"
            fi
        elif [[ -d "${FULL_PATH}" ]]; then
            dir_menu "${FULL_PATH}"
        elif [[ -f "${FULL_PATH}" ]]; then
            case "${FULL_PATH}" in
                *.sh)  bash -c "source ${XDOTOOL_DIR}/env.sh ${FULL_PATH} && source ${FULL_PATH}" ;;
                *.py)  python3 "${FULL_PATH}"  ;;
                *.pl)  perl "${FULL_PATH}"  ;;
                *)     paste_command "Unknown file type: ${FULL_PATH}"; ;;
            esac

            exit 0
        #else
        #    paste_command "unknown file/folder: '${FULL_PATH}', '${NAME}' $(type $FULL_PATH)"
        fi
    done
}

check_for_updates
dir_menu "${SCRIPTS_DIR}"
