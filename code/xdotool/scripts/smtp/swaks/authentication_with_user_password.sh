#!/bin/bash

: '
authentication with user and password
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "auth email" "auth password" "server"

AUTH_EMAIL=${form_data["auth email"]}
AUTH_PASSWORD=${form_data["auth password"]}
SERVER=${form_data["server"]}

paste_command "swaks --auth-user '${AUTH_EMAIL}' --auth LOGIN --auth-password ${AUTH_PASSWORD} --quit-after AUTH --server ${SERVER}"
