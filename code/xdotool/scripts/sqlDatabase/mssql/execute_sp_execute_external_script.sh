#!/bin/bash

: '
execute sp_execute_external_script command
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "CMD"

CMD=${form_data["CMD"]}
paste_command "EXEC sp_execute_external_script @language =N'Python', @script = N'import os; os.system(\"${CMD}\");';"
xdotool key Return