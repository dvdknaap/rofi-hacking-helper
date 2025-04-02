#!/bin/bash

: '
Identify users that can be impersonate
'

execute_command "SELECT distinct b.name FROM sys.server_permissions a INNER JOIN sys.server_principals b ON a.grantor_principal_id = b.principal_id WHERE a.permission_name = 'IMPERSONATE'"
create_new_line
