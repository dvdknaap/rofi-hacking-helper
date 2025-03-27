#!/bin/bash

replace_in_file() {
    local input_file="$1"
    local output_file="$2"
    shift 2

    if [ ! -f "$input_file" ]; then
        echo "Error: Input file '$input_file' does not exist." >&2
        exit 1
    fi

    if (( $# % 2 != 0 )); then
        echo "Error: Replacement arguments must be in pairs (search and replace)." >&2
        exit 1
    fi

    local sed_commands=()
    while (( $# > 0 )); do
        local search="$1"
        local replace="$2"
        shift 2

        # Ontsnap vierkante haken
        search=$(printf '%s\n' "$search" | sed 's/\[/\\[/g; s/\]/\\]/g')

        sed_commands+=(-e "s|$search|$replace|g")
    done

    sed "${sed_commands[@]}" "$input_file" > "$output_file"
    #echo "Processed file saved as: $output_file"
}

# Declare TMP_FILE as a global variable
TMP_FILE=""

find_and_replace_file() {
    local location="${1}"
    local file="${2}"

    # Check for required arguments
    if [ -z "${location}" ] || [ -z "${file}" ]; then
        paste_command 'Usage: find_and_replace_file "location" "file"'
        exit 1
    fi

    # Expand ~ to the full path manually
    location="${location/#\~/$HOME}"

    FILES_FOLDER="${location}"

    file_name="${file%.*}"
    extension="${file##*.}"

    SRC_FILE="${FILES_FOLDER}/${file_name}.${extension}"
    TMP_FILE="${FILES_FOLDER}/${file_name}_tmp.${extension}"

    # Pass all arguments starting from $3 onwards (find/replace pairs)
    shift 2
    replace_in_file "${SRC_FILE}" "${TMP_FILE}" "$@"

    sleep 60 && rm $TMP_FILE &
}
