#!/bin/bash

SCREENSHOT_PATH="${SCREENSHOTS_DIR}"
screenshot_filename=""

if [[ ! -d "${SCREENSHOT_PATH}" ]]; then
    mkdir "${SCREENSHOT_PATH}"
fi

# Check if the JSON file exists
if [[ -f "${ACTIVE_DYNAMIC_FIELDS_FILE}" ]]; then
    output_json=$(cat "${ACTIVE_DYNAMIC_FIELDS_FILE}")

    # Extract important fields (like ip, username, password, domain) from the JSON
    ip=$(echo "${output_json}" | jq -r '.ip')
    username=$(echo "${output_json}" | jq -r '.username')
    password=$(echo "${output_json}" | jq -r '.password')
    domain=$(echo "${output_json}" | jq -r '.domain')
    current_date_time="$(date +"%Y_%m_%d_%H_%M_%S")"

    # Generate the new file name based on md5sum of ip, username, password, and domain
    screenshot_filename="${SCREENSHOT_PATH}/$(echo -n "${ip}_${username}_${password}_${domain}_${current_date_time}" | base64 | sed 's/==//').png"
else
    screenshot_filename="${SCREENSHOT_PATH}/$(date +"%Y_%m_%d-%H_%M_%S").png"

    if [[ -f "${screenshot_filename}" ]]; then
        show_error_notify_message "screenshot file already exists: ${screenshot_filename}"
        exit 1
    fi
fi

# wait for focus
sleep 0.8

import -window root ${screenshot_filename}

show_success_notify_message "screenshot created: ${screenshot_filename}"
