#!/bin/bash

: '
Powershell: start http server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
URL_FIELD=$(form_item  "url" "url" "http://localhost:9092/")
CONTENT_TYPE_FIELD=$(form_item  "content type" "content_type" "text/HTML")
FILE_PATH_FIELD=$(form_item  "file path" "file_path" "C:\Users\file.txt")

# Generate GUI form
generate_form "${URL_FIELD}" "${CONTENT_TYPE_FIELD}" "${FILE_PATH_FIELD}"

URL=${form_data["url"]}
CONTENT_TYPE=${form_data["content_type"]}
FILE_PATH=${form_data["file_path"]}

execute_command "\$httpListener = New-Object System.Net.HttpListener"
create_new_line
sleep 1

execute_command "\$httpListener.Prefixes.Add(\"${URL}\")"
create_new_line
sleep 1

execute_command "\$context = \$httpListener.GetContext()"
create_new_line
sleep 1

execute_command "\$context.Response.StatusCode = 200"
create_new_line
sleep 1

execute_command "\$context.Response.ContentType = '${CONTENT_TYPE}'"
create_new_line
sleep 1

execute_command "\$WebContent = Get-Content  -Path \"${FILE_PATH}\" -Encoding UTF8"
create_new_line
sleep 1

execute_command "\$EncodingWebContent = [Text.Encoding]::UTF8.GetBytes(\$WebContent)"
create_new_line
sleep 1

execute_command "\$context.Response.OutputStream.Write(\$EncodingWebContent , 0, \$EncodingWebContent.Length)"
create_new_line
sleep 1

execute_command "\$httpListener.Start()"
create_new_line
sleep 1

execute_command "\$context.Response.Close()"
create_new_line
