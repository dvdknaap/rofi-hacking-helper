 #!/bin/bash

convert_to_john() {
    local john_program="${1}"

    # Generate GUI form items (label, type (optional: default text), name, default (optional))
    INPUT_FILE_FIELD=$(form_item "input file" "input_file")
    HASH_FILE_FIELD=$(form_item "hash file" "hash_file" "${john_program}.hashes")

    # Generate GUI form
    generate_form "${INPUT_FILE_FIELD}" "${HASH_FILE_FIELD}"

    INPUT_FILE=${form_data["input_file"]}
    HASH_FILE=${form_data["hash_file"]}

    execute_command "${john_program} ${INPUT_FILE} > ${HASH_FILE}"
    create_new_line
}
