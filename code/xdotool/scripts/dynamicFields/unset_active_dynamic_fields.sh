#!/bin/bash

: '
remove active dynamic fields as default
'

if [ -f "${ACTIVE_DYNAMIC_FIELDS_FILE}" ]; then
  rm "${ACTIVE_DYNAMIC_FIELDS_FILE}"

  # notify user
  show_success_notify_message "default dynamic fields are removed"
fi
