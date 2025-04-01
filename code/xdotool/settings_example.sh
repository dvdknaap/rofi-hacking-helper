#!/bin/bash

# before editing, copy this file to settings.sh
# cp code/xdotool/settings_example.sh code/xdotool/settings.sh

# execute command type (paste or type)
SETTING_EXECUTE_COMMAND_TYPE="paste"

## xdotool opions
SETTING_TYPING_DELAY=0.3          # Delay between rofi screen and typing      
SETTING_TYPING_CHARACTER_DELAY=0  # Delay between characters

# default user when a user is created
SETTING_DEFAULT_USER="rofi"
SETTING_DEFAULT_PASSWORD="Password@rofi1"

# Virus total API KEY
add_field_to_dynamic_field_system "VIRUS_TOTAL_API_KEY" ""
