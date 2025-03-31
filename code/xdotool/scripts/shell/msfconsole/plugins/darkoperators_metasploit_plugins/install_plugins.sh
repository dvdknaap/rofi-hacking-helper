#!/bin/bash

: '
install plugins
'

TMP_DIR="/tmp/Metasploit-Plugins"

paste_command "git clone https://github.com/darkoperator/Metasploit-Plugins /tmp/Metasploit-Plugins"
xdotool key Return
sleep 2

paste_command "sudo cp ${TMP_DIR}/pentest.rb /usr/share/metasploit-framework/plugins/pentest.rb"
xdotool key Return
sleep 0.8

paste_command "sudo cp ${TMP_DIR}/growl.rb /usr/share/metasploit-framework/plugins/growl.rb"
xdotool key Return
sleep 0.8

paste_command "sudo cp ${TMP_DIR}/twitt.rb /usr/share/metasploit-framework/plugins/twitt.rb"
xdotool key Return
sleep 0.8
