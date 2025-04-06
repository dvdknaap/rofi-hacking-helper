#!/bin/bash

: '
ps: get clear password from powershell credentials xml file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "cred file name" "credential_file_name")

# Generate GUI form
generate_form "${FILE_FIELD}"

FILE=${form_data["credential_file_name"]}

execute_command "(\$credXml = [xml]::new()).Load($\PWD.ProviderPath + '\\${FILE}')"
create_new_line
sleep 0.8

execute_command "\$username, \$encryptedPassword = \$credXml.SelectNodes('//*[@N=\"UserName\" or @N=\"Password\"]').'#text'"
create_new_line
sleep 0.8

execute_command "\$networkCred = [System.Net.NetworkCredential]::new(\$username, (ConvertTo-SecureString \$encryptedPassword))"
create_new_line
sleep 0.8

execute_command "\$networkCred.UserName"
create_new_line
sleep 0.8

execute_command "\$networkCred.password"
create_new_line
