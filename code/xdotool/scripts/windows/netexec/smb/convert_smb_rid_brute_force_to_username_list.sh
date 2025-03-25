#!/bin/bash

: '
convert smb rid-bruteforce to users list
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "Input file", "type": "text", "name": "input_file"}' '{"label": "Output file", "type": "text", "name": "output_file"}'

INPUT_FILE=${form_data["input_file"]}
OUTPUT_FILE=${form_data["output_file"]}

paste_command "cat ${INPUT_FILE} | grep 'SidTypeUser' | awk '{print \$6}'  | awk -F '\' '{print \$2}' | tr '[:upper:]' '[:lower:]' | grep -v '\\$' > ${OUTPUT_FILE}"