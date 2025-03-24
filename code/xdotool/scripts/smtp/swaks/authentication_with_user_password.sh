#!/bin/bash

: '
authentication with user and password
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
AUTH_EMAIL_FIELD=$(form_item  "auth email" "auth_email")
AUTH_PASSWORD_FIELD=$(form_item  "auth password" "auth_password")
SERVER_FIELD=$(form_item  "server" "server")

# Generate GUI form
generate_form "${AUTH_EMAIL_FIELD}" "${AUTH_PASSWORD_FIELD}" "${SERVER_FIELD}"

AUTH_EMAIL=${form_data["auth_email"]}
AUTH_PASSWORD=${form_data["auth_password"]}
SERVER=${form_data["server"]}

paste_command "swaks --auth-user '${AUTH_EMAIL}' --auth LOGIN --auth-password ${AUTH_PASSWORD} --quit-after AUTH --server ${SERVER}"
xdotool key Return