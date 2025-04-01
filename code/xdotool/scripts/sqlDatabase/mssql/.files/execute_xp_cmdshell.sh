#!/bin/bash

execute_xp_cmdshell () {
    local cmd="$1"
    
    execute_command "EXEC xp_cmdshell \"${CMD}\";"
    create_new_line
}
