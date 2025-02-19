#!/bin/bash

function dir_menu {
    DIR_LOCAL=$1

    # List content, get choice from user
    SCRIPT=$(ls "${DIR_LOCAL}" | rofi -dmenu -p "🐱‍💻")

    if [ -n "$SCRIPT" ]; then

        # If directory, recursively continue in directory
        if [[ -d $SCRIPT ]]; then
            cd $SCRIPT
            dir_menu $PWD
            return 1

        # Execute if it's a script
        elif [[ -f $SCRIPT ]]; then
            bash "${DIR_LOCAL}/${SCRIPT}"
            return 2

        fi
    fi
}

# Set basedir and start there
BASEDIR=~/Desktop/base/code/xdotool/scripts
cd $BASEDIR
dir_menu $BASEDIR

