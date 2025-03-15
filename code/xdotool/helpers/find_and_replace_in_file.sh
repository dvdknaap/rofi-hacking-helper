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
