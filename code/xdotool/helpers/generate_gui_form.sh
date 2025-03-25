#!/bin/bash

# Get the directory of the current script
python_script="${HOME}/Desktop/base/code/xdotool/helpers/generate_gui_form.py"

# Function to create a form item json
form_item() {
    local label="$1"
    local type="text"
    local name="$2"
    local default="${3:-}"
    local options="${4:-}"

    # If there are five arguments overwrite type field
    if [[ "$#" == 5 ]]; then
        type="$2"
        name="$3"
        default="$4"

        # Convert string to json
        options=$(echo "$5" | jq -c -R 'split("|")')

        jq -cn --arg label "${label}" --arg type "${type}" --arg name "${name}" --arg default "${default}" \
            "{label: \$label, type: \$type, name: \$name, default: \$default, options: $options}"

    # If there are four arguments overwrite type field
    elif [[ "$#" == 4 ]]; then
        type="$2"
        name="$3"
        default="$4"

        jq -cn --arg label "${label}" --arg type "${type}" --arg name "${name}" --arg default "${default}" \
            '{label: $label, type: $type, name: $name, default: $default}'

    # If there are four arguments overwrite type field
    elif [[ "$#" == 3 ]]; then
        default="$3"

        jq -cn --arg label "${label}" --arg type "${type}" --arg name "${name}" --arg default "${default}" \
            '{label: $label, type: $type, name: $name, default: $default}'
    else
        jq -cn --arg label "${label}" --arg type "${type}" --arg name "${name}" \
            '{label: $label, type: $type, name: $name}'
    fi
}

# Function to generate a GUI form and return user input in a structured way
generate_form() {
    # Check if at least one argument is provided
    if [ $# -eq 0 ]; then
        paste_command "Usage: generate_form \"Field 1\" \"Field 2\" ..."
        paste_command "or"
        paste_command "generate_form '{\"label\": \"Field 1\", \"type\": \"text\", \"name\": \"field1\"}' '{\"label\": \"Field 2\", \"type\": \"password\", \"name\": \"field2\"}' ..."
        exit 1
    fi

    # Detect input format and build JSON array
    json_array="[]"
    for arg in "$@"; do
        if echo "$arg" | jq empty 2>/dev/null; then
            # Argument is already a JSON object
            json_array=$(echo "$json_array" | jq -c --argjson obj "$arg" '. + [$obj]')
        else
            # Argument is a plain string, convert it to JSON format
            safe_field=$(echo "${arg}" | sed 's/\\/\\\\/g; s/"/\\"/g')
            json_object="{\"label\": \"${safe_field}\", \"type\": \"text\", \"name\": \"${safe_field// /_}\"}"
            json_array=$(echo "$json_array" | jq -c --argjson obj "$json_object" '. + [$obj]')
        fi
    done

    # Call the Python script and capture the JSON response
    json_output=$(python3 "${python_script}" "${json_array}" 2>/dev/null)
    if [ $? -ne 0 ]; then
        paste_command "python3 ${python_script} '${json_array}'"
        paste_command "Error: Failed to execute ${python_script}"
        paste_command "${json_output}"
        exit 1
    fi

    # Parse JSON output into a Bash associative array
    declare -gA form_data
    while IFS="=" read -r key value; do
        clean_key=$(echo "${key}" | sed 's/\\\\/\\/g')
        form_data["${clean_key}"]="${value}"
    done < <(echo "${json_output}" | jq -r 'to_entries | .[] | .key + "=" + .value')

    return 0
}
