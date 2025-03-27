#!/bin/bash

: '
get a current active dynamic field
'

FIELD_VALUE=$(python3 "${generate_gui_dynamic_field_value_form_script}" "${ACTIVE_DYNAMIC_FIELDS_FILE}")

if [ ! -n "${FIELD_VALUE}" ]; then
    # notify user
    show_error_notify_message "no dynamic field value"
    exit
fi

paste_command "${FIELD_VALUE}"
