#!/bin/bash

: '
ldapsearch show user info of specific namingcontexts
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}' "namingcontexts" "user" "password"

IP=${form_data["IP"]}
NAMING_CONTEXTS=${form_data["namingcontexts"]}
USER=${form_data["user"]}
PASSWORD=${form_data["password"]}

paste_command "ldapsearch -x -b \"${NAMING_CONTEXTS}\" -s sub \"(&(objectCategory=person)(objectClass=user)(!(useraccountcontrol:1.2.840.113556.1.4.803:=2))(serviceprincipalname=*/*))\" -H 'ldap://${IP}' -D '${USER}' -w '${PASSWORD}' | grep -i serviceprincipalname: | cut -f 2 -d \" \""
xdotool key Return