#!/bin/bash

: '
show a list of dynamic fields and select one to use as default values
'

# Show a list of dynamic fields
selected_dynamic_field=$(python3 "${HELPERS_DIR}"/generate_gui_dynamic_fields_form.py "${DYNAMIC_FIELDS_DIR}")

cp "${selected_dynamic_field}" "${ACTIVE_DYNAMIC_FIELDS_FILE}"

# notify user
show_success_notify_message "selected dynamic fields are set as default"
