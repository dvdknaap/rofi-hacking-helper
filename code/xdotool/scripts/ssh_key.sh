#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

SSH_KEY=$(cat ~/.ssh/id_ed25519.pub | tr -d '\n')

paste_command "${SSH_KEY}"
