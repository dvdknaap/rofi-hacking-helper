#!/bin/bash

: '
ps: Makes the current PowerShell thread impersonate SYSTEM.
'

paste_command "Invoke-TokenManipulation -ImpersonateUser -Username \"nt authority\system\""
xdotool key Return
