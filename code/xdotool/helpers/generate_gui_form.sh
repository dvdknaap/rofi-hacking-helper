#!/bin/bash

# Get the directory of the current script
python_script="${HOME}/Desktop/base/code/xdotool/helpers/generate_gui_form.py"

# Function to generate a GUI form and return user input in a structured way
generate_form() {
    # Check if at least one argument is provided
    if [ $# -eq 0 ]; then
        echo "Usage: generate_form \"Field 1\" \"Field 2\" \"Field 3\" ..."
        return 1
    fi

    # Build JSON input from arguments (escaping special characters)
    json_input="["
    first=true
    for field in "$@"; do
        # Escape backslashes and double quotes
        safe_field=$(echo "${field}" | sed 's/\\/\\\\/g; s/"/\\"/g')

        if [ "${first}" = true ]; then
            first=false
        else
            json_input+=", "
        fi
        json_input+="\"${safe_field}\""
    done
    json_input+="]"

    # Call the Python script and capture the JSON response
    json_output=$(python3 "${python_script}" "${json_input}" 2>/dev/null)
    if [ $? -ne 0 ]; then
        echo "Error: Failed to execute ${python_script}"
        return 1
    fi

    # Parse JSON output into a Bash associative array
    declare -gA form_data
    while IFS="=" read -r key value; do
        # Remove extra backslashes added by JSON escaping
        clean_key=$(echo "${key}" | sed 's/\\\\/\\/g')
        form_data["${clean_key}"]="${value}"
    done < <(echo "${json_output}" | jq -r 'to_entries | .[] | .key + "=" + .value')

    return form_data
}