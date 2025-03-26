#!/bin/bash

: '
show a list of dynamic fields so you can edit them
'

# Show a list of dynamic fields
selected_dynamic_field=$(python3 "${HELPERS_DIR}"/generate_gui_dynamic_fields_form.py "${DYNAMIC_FIELDS_DIR}")

start_form_and_save "${selected_dynamic_field}"

# notify user
show_success_notify_message "dynamic fields are saved"
