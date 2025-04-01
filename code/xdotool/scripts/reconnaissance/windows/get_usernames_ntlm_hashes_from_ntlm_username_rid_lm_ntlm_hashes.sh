 #!/bin/bash

: '
save username and ntlm hashes in seperated files from form username:RID:LM:NTLM:::
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
NTLM_FILE_FIELD=$(form_item "NTLM file" "ntlm_file")
USERNAME_OUTPUT_FILE_FIELD=$(form_item "username output file" "username_output_file" "usernames.txt")
HASHES_OUTPUT_FILE_FIELD=$(form_item "hash output file" "hash_output_file" "hashes.txt")

# Generate GUI form
generate_form "${NTLM_FILE_FIELD}" "${USERNAME_OUTPUT_FILE_FIELD}" "${HASHES_OUTPUT_FILE_FIELD}"

NTLM_FILE=${form_data["ntlm_file"]}
USERNAME_OUTPUT_FILE=${form_data["username_output_file"]}
HASHES_OUTPUT_FILE=${form_data["hash_output_file"]}

execute_command "cat ${NTLM_FILE} | cut -d ':' -f 1 > ${USERNAME_OUTPUT_FILE}; cat ${NTLM_FILE} | cut -d ':' -f 4 > ${HASHES_OUTPUT_FILE}"
create_new_line
