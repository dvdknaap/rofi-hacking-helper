 #!/bin/bash

: '
Format username:RID:LM:NTLM::: to hashcat format
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
HASH_FIELD=$(form_item "hash file" "hash_file")
OUTPUT_FIELD=$(form_item "output file" "output_file")

# Generate GUI form
generate_form "${HASH_FIELD}" "${OUTPUT_FIELD}"

HASH_FILE=${form_data["hash_file"]}
OUTPUT_FILE=${form_data["output_file"]}

execute_command "cat ${HASH_FILE} | cut -d ':' -f 1,4 > ${OUTPUT_FILE}"
create_new_line
