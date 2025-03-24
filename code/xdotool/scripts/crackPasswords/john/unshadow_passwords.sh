 #!/bin/bash

: '
unshadow /etc/passwords
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
ETC_PASSWORD_FIELD=$(form_item "etcPasswd file" "etcPasswd_file")
SHADOW_FIELD=$(form_item "shadow file" "shadow_file")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist_file" "/usr/share/wordlists/rockyou.txt")

# Generate GUI form
generate_form "${ETC_PASSWORD_FIELD}" "${SHADOW_FIELD}" "${WORDLIST_FIELD}"

ETC_PASSWORD_FILE=${form_data["etcPasswd_file"]}
SHADOW_FILE=${form_data["shadow_file"]}
WORDLIST_FILE=${form_data["wordlist_file"]}

paste_command "unshadow ${ETC_PASSWORD_FILE} ${SHADOW_FILE} > unshadow.txt"
xdotool key Return
sleep 2

paste_command "john --wordlist=${WORDLIST_FILE} unshadow.txt"
xdotool key Return
sleep 2