#!/bin/bash

: '
get current active dynamic field website
'

FIELD="website"
FIELD_VALUE=$(get_dynamic_field "${FIELD}")

if [ -z "${FIELD_VALUE}" ]; then
    # notify user
    show_error_notify_message "no dynamic ${FIELD} field"
    exit
fi

execute_command "${FIELD_VALUE}"
