#!/bin/bash

: '
send email
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "to" "from" "subject" "body" "server" "attachment"

get_mimetype(){
  # warning: assumes that the passed file exists
  file --mime-type "$1" | sed 's/.*: //' 
}

TO=${form_data["to"]}
FROM=${form_data["from"]}
SUBJECT=${form_data["subject"]}
BODY=${form_data["body"]}
SERVER=${form_data["server"]}
ATTACHMENT=${form_data["attachment"]}
ATTACHMENT_TYPE=$(get_mimetype ${ATTACHMENT})

paste_command "swaks --to ${TO} --from ${FROM} --header \"Subject: ${SUBJECT}\" --body \"${BODY}\" --server ${SERVER} --attach-type ${ATTACHMENT_TYPE} --attach ${ATTACHMENT}"
xdotool key Return