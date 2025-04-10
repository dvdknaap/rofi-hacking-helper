#!/bin/bash

DYNAMIC_FIELDS_FORM_SCRIPT="${HELPERS_DIR}/generate_gui_cred_system_form.py"
ACTIVE_DYNAMIC_FIELDS_FILE="${DYNAMIC_FIELDS_DIR}/active_dynamic_fields.json"

add_field_to_dynamic_field_system() {
    local field_name="${1}"
    local field_value="${2}"

    ACTIVE_CRED_SYSTEM["${field_name}"]="${field_value}"
}

get_dynamic_field() {
    local field_name="${1}"

    echo "${ACTIVE_CRED_SYSTEM[${field_name}]}";
}

load_dynamic_fields() {
    local json_file="${ACTIVE_DYNAMIC_FIELDS_FILE}"

    # Check if the JSON file exists
    if [[ -f "${json_file}" ]]; then
        # Read the JSON and iterate through the key-value pairs
        while IFS="=" read -r key value; do
            # Remove double quotes around key and value
            key=$(echo "${key}" | tr -d '"')
            value=$(echo "${value}" | tr -d '"')
            
            add_field_to_dynamic_field_system "${key}" "${value}"
        done < <(jq -r 'to_entries[] | .key + "=" + .value' "${json_file}")
    fi
}

# Function to generate the form, save the JSON, and create the file
start_form_and_save() {
    local input_file="${1:-''}"
    local input_json=''
    local output_json
    local json_filename
    local ip
    local username
    local password
    local domain

    # If a file is provided, load its contents as JSON
    if [[ -n "$input_file" && -f "$input_file" ]]; then
        input_json=$(cat "$input_file")
        echo "File loaded from: $input_file"
    fi

    # Run the form and get the JSON output
    output_json=$(python3 "${DYNAMIC_FIELDS_FORM_SCRIPT}" --fields "${input_json}")

    # Ensure that we receive valid JSON output
    if [[ $? -ne 0 || -z "${output_json}" ]]; then
        echo "Error: Form submission failed or no output received."
        return 1
    fi

    # Extract important fields (like ip, username, password, domain) from the JSON
    ip=$(echo "${output_json}" | jq -r '.ip')
    username=$(echo "${output_json}" | jq -r '.username')
    password=$(echo "${output_json}" | jq -r '.password')
    domain=$(echo "${output_json}" | jq -r '.domain')

    # create folder if it doesnt exists
    if [[ ! -d "${DYNAMIC_FIELDS_DIR}" ]]; then
        mkdir "${DYNAMIC_FIELDS_DIR}"
    fi

    # Generate the new file name based on md5sum of ip, username, password, and domain
    new_filename=$(echo -n "${ip}_${username}_${password}_${domain}" | md5sum | cut -d' ' -f1)
    json_filename="${DYNAMIC_FIELDS_DIR}/${new_filename}.json"

    # If a file was provided, remove old file
    if [[ -n "${input_file}" && -f "${input_file}" ]]; then
        SYMLINK_TARGET=$(readlink -f "${ACTIVE_DYNAMIC_FIELDS_FILE}")

        rm "${input_file}"

        # update active dynamic fields symlink if needed
        if [ "${SYMLINK_TARGET}" == "${input_file}" ]; then
            ln -sf "${json_filename}" "${ACTIVE_DYNAMIC_FIELDS_FILE}"
        fi
    fi

    # Save the JSON to the file
    echo "${output_json}" > "${json_filename}"
    ret=$?
    if [[ $ret -ne 0 ]]; then
        echo "JSON saved to: ${json_filename}"
    else
        echo "Error saving JSON to ${json_filename}"
        return 1
    fi
}

debug_active_cred_system() {
    if [[ ${#ACTIVE_CRED_SYSTEM[@]} -eq 0 ]]; then
        echo "ACTIVE_CRED_SYSTEM is empty."
        return
    fi

    # Add each field to the JSON object
    for key in "${!ACTIVE_CRED_SYSTEM[@]}"; do
        json_output+="\"${key}\": \"${ACTIVE_CRED_SYSTEM[${key}]}\","
    done

    # Remove the last comma
    json_output="${json_output%,}"

    # Print the JSON output
    echo "{${json_output}}" | jq .
}
