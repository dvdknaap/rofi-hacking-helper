#!/bin/bash

SCRIPTS_DIR="$HOME/Desktop/base/code/xdotool/scripts"
OUTPUT_FILE="$HOME/Desktop/base/documentation/script_list.md"

# Function to get description
function get_description {
    local file=$1
    local description=""

    if [[ -f "${file}" ]]; then
        description=$(sed -n "/^: '\$/,/^'\$/{//!p}" "${file}")
    elif [[ -d "${file}" && -f "${file}/.desc" ]]; then
        description=$(cat "${file}/.desc")
    else
        description=""
    fi

    echo "${description}"
}

# Function to get the correct icon
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

# Function to process directories recursively
function process_directory {
    local dir="$1"
    local depth="$2"

    # Skip directories starting with a dot
    if [[ "$(basename "${dir}")" =~ ^\. ]]; then
        echo "Skipping dot directory: ${dir}"  # Logging
        return
    fi

    # Get the relative path for the directory (after SCRIPTS_DIR)
    relative_dir="${dir#$SCRIPTS_DIR/}"

    dir_desc=$(get_description "${dir}")

    # Print the directory name based on its depth
    if [[ ${depth} -eq 1 ]]; then
        echo "### 📂 ${relative_dir}"   # For the first sub-directory
    else
        echo "** 📂 ${relative_dir}**"   # For deeper sub-directories
    fi

    [[ -n "${dir_desc}" ]] && echo "" && echo "${dir_desc}"
    echo ""

    # List files in this directory
    local file_count=$(find "${dir}" -maxdepth 1 -type f ! -name ".*" | wc -l)

    # If there are files, print the table header
    if [[ ${file_count} -gt 0 ]]; then
        echo "| Path | Description |"
        echo "|------|-------------|"

        find "${dir}" -maxdepth 1 -type f ! -name ".*" | sort | while read -r file; do
            echo "| $(get_icon "${file}") \`${file#$SCRIPTS_DIR/}\` | $(get_description "${file}") |"
        done
    fi

    # Then process subdirectories, but skip dot directories
    find "${dir}" -mindepth 1 -maxdepth 1 -type d ! -name ".*" | while read -r sub_dir; do
        # Check if the subdirectory is a dot directory
        if [[ ! "$(basename "${sub_dir}")" =~ ^\. ]]; then
            process_directory "${sub_dir}" $((depth + 1))
        else
            echo "Skipping dot subdirectory: ${sub_dir}"  # Logging
        fi
    done

    echo ""
}

# Ensure the scripts directory exists
if [[ ! -d "${SCRIPTS_DIR}" ]]; then
    echo "Error: Scripts directory not found!"
    exit 1
fi

# Start writing to the markdown file
{
    echo "# 📜 Script Documentation"
    echo ""
    echo "## 📌 Table of Contents"
    echo ""

    # Include the main scripts directory files in TOC
    echo "- [Main Scripts](#main-scripts)"

    # Generate an overview with clickable links for subdirectories
    for dir in "${SCRIPTS_DIR}"/*/; do
        if [[ -d "${dir}" && ! "$(basename "${dir}")" =~ ^\. ]]; then
            echo "- [$(basename "${dir}")](#$(basename "${dir}" | tr ' ' '-' | tr '[:upper:]' '[:lower:]'))"
        fi
    done

    echo ""
    echo "---"
    echo ""

    # List main directory files, excluding ones starting with '.'
    echo "### Main Scripts"
    echo ""
    echo "| Path | Description |"
    echo "|------|-------------|"

    for file in "${SCRIPTS_DIR}"/*; do
        if [[ -f "${file}" && ! "$(basename "${file}")" =~ ^\. ]]; then
            echo "| $(get_icon "${file}") \`${file#$SCRIPTS_DIR/}\` | $(get_description "${file}") |"
        fi
    done

    echo ""

    # Process directories, excluding those starting with '.'
    for dir in "${SCRIPTS_DIR}"/*/; do
        process_directory "${dir}" 1  # Start processing with depth 1
    done
} > "${OUTPUT_FILE}"

echo "✅ Script list generated: ${OUTPUT_FILE}"