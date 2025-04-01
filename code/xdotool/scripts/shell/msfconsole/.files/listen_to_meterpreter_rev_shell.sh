#!/bin/bash

create_meterpreter_multi_handler() {
    local PAYLOAD="${1}"

    # Generate GUI form items (label, type (optional: default text), name, default (optional))
    LPORT_FIELD=$(form_item  "LPORT" "number" "LPORT" "1337")

    # Generate GUI form
    generate_form "${LPORT_FIELD}"

    FILES_FOLDER="${SCRIPTS_DIR}/shell/msfconsole/.files"
    LPORT=${form_data["LPORT"]}

    # Define replacement fields
    REPLACE_FIELDS=(
        "[LPORT]" "${LPORT}"
        "[payload]" "${PAYLOAD}"
    )

    find_and_replace_file "${FILES_FOLDER}" "multi_handler.rc" "${REPLACE_FIELDS[@]}"

    execute_command "msfconsole -r ${TMP_FILE}"
    create_new_line
}
