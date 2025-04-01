#!/bin/bash

: '
install plugins
'

TMP_DIR="/tmp/Metasploit-Plugins"

execute_command "git clone https://github.com/darkoperator/Metasploit-Plugins /tmp/Metasploit-Plugins"
create_new_line
sleep 2

execute_command "sudo cp ${TMP_DIR}/pentest.rb /usr/share/metasploit-framework/plugins/pentest.rb"
create_new_line
sleep 0.8

execute_command "sudo cp ${TMP_DIR}/growl.rb /usr/share/metasploit-framework/plugins/growl.rb"
create_new_line
sleep 0.8

execute_command "sudo cp ${TMP_DIR}/twitt.rb /usr/share/metasploit-framework/plugins/twitt.rb"
create_new_line
sleep 0.8
