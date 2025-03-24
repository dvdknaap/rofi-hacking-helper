#!/bin/bash

execute_xp_cmdshell () {
    local cmd="$1"
    
    paste_command "EXEC xp_cmdshell \"${CMD}\";"
    xdotool key Return
}