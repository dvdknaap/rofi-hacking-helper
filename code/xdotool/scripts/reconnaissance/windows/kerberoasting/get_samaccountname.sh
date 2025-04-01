#!/bin/bash

: '
PowerShell: Get SPN user account names.
'

execute_command "Get-DomainUser * -spn | select samaccountname"
create_new_line
