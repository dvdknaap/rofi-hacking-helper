#!/bin/bash

json_file="${ACTIVE_DYNAMIC_FIELDS_FILE}"
screenshot_path="${SCREENSHOTS_DIR}"
screenshot_filename=""

# Check if the JSON file exists
if [[ -f "${json_file}" ]]; then
    output_json=$(cat "${json_file}")

    # Extract important fields (like ip, username, password, domain) from the JSON
    ip=$(echo "${output_json}" | jq -r '.ip')
    username=$(echo "${output_json}" | jq -r '.username')
    password=$(echo "${output_json}" | jq -r '.password')
    domain=$(echo "${output_json}" | jq -r '.domain')
    current_date_time="$(date +"%Y_%m_%d_%H_%M_%S")"

    # Generate the new file name based on md5sum of ip, username, password, and domain
    screenshot_filename="${screenshot_path}/$(echo -n "${ip}_${username}_${password}_${domain}_${current_date_time}").png"
else
    # Generate GUI form items (label, type (optional: default text), name, default (optional))
    SCREENSHOT_FILE_FIELD=$(form_item "screenshot filename" "screenshot_file" "$(date +"%Y_%m_%d_%H_%M_%S")")

    # Generate GUI form
    generate_form "${SCREENSHOT_FILE_FIELD}"

    SCREENSHOT_FILE="${form_data["screenshot_file"]}"

    screenshot_filename="${screenshot_path}/${SCREENSHOT_FILE}.png"

    if [[ -f "${screenshot_filename}" ]]; then
        show_error_notify_message "screenshot file already exists: ${screenshot_filename}"
        exit 1
    fi
fi

# wait for focus
sleep 0.8

paste_command "import -window root ${screenshot_filename}"

show_success_notify_message "screenshot created: ${screenshot_filename}"
