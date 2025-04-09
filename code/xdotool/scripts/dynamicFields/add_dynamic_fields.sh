#!/bin/bash

: '
add new dynamic fields
'

# Start dynamic form and save fields to json file
RESPONSE=$(start_form_and_save)

if [ "${RESPONSE}" == "0" ]; then
  # notify user
  show_success_notify_message "dynamic fields are saved"
fi
