#!/bin/bash

: '
PowerShell: Get users with non-null descriptions.
'

execute_command 'Get-DomainUser * |select samaccountname,description | ?{$_.Description -ne $null}'
create_new_line
