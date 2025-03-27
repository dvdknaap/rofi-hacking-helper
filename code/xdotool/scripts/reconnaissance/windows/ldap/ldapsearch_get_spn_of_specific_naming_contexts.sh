#!/bin/bash

: '
ldapsearch show user info of specific namingcontexts
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
NAMING_CONTEXTS_FIELD=$(form_item  "namingcontexts" "namingcontexts")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")

# Generate GUI form
generate_form "${IP_FIELD}" "${NAMING_CONTEXTS_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

IP=${form_data["ip"]}
NAMING_CONTEXTS=${form_data["namingcontexts"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

paste_command "ldapsearch -x -b \"${NAMING_CONTEXTS}\" -s sub \"(&(objectCategory=person)(objectClass=user)(!(useraccountcontrol:1.2.840.113556.1.4.803:=2))(serviceprincipalname=*/*))\" -H 'ldap://${IP}' -D '${USER}' -w '${PASSWORD}' | grep -i serviceprincipalname: | cut -f 2 -d \" \""
xdotool key Return
