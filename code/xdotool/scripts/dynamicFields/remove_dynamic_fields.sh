#!/bin/bash

: '
show a list of dynamic fields so you can remove them
'

# Show a list of dynamic fields
selected_dynamic_field=$(python3 "${HELPERS_DIR}"/generate_gui_dynamic_fields_form.py "${DYNAMIC_FIELDS_DIR}")

if [ -f "${selected_dynamic_field}" ]; then
    rm "${selected_dynamic_field}"
fi

# notify user
show_success_notify_message "dynamic fields is removed"
