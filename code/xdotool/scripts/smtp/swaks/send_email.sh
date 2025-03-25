#!/bin/bash

: '
send email
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
TO_FIELD=$(form_item  "to" "to")
FROM_FIELD=$(form_item  "from" "from")
SUBJECT_FIELD=$(form_item  "subject" "subject")
BODY_FIELD=$(form_item  "body" "body")
SERVER_FIELD=$(form_item  "server" "server")

# Generate GUI form
generate_form "${TO_FIELD}" "${FROM_FIELD}" "${SUBJECT_FIELD}" "${BODY_FIELD}" "${SERVER_FIELD}"

TO=${form_data["to"]}
FROM=${form_data["from"]}
SUBJECT=${form_data["subject"]}
BODY=${form_data["body"]}
SERVER=${form_data["server"]}

paste_command "swaks --to ${TO} --from ${FROM} --header \"Subject: ${SUBJECT}\" --body \"${BODY}\" --server ${SERVER}"
xdotool key Return