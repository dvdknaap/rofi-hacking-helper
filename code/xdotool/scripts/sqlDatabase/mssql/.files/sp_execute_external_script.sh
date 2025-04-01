#!/bin/bash

execute_external_script () {
    local cmd="$1"
    
    execute_command "EXEC sp_execute_external_script @language =N'Python', @script = N'import os; os.system(\"${cmd}\");';"
    create_new_line
}
