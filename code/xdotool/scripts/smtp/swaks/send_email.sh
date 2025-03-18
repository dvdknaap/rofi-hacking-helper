#!/bin/bash

: '
send email
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "to" "from" "subject" "body" "server"

TO=${form_data["to"]}
FROM=${form_data["from"]}
SUBJECT=${form_data["subject"]}
BODY=${form_data["body"]}
SERVER=${form_data["server"]}

paste_command "swaks --to ${TO} --from ${FROM} --header \"Subject: ${SUBJECT}\" --body \"${BODY}\" --server ${SERVER}"