#!/bin/bash

: '
Perform mini Windows Linpeas to get pentest info
'

declare -gA all_commands
all_commands["whoami"]='whoami /all'
all_commands["net user"]='net user'
all_commands["net domain user"]='net user /domain'
all_commands["net group user"]='net group /domain'
all_commands["get local group members of administrators"]='net group "administrators" /domain'
all_commands["get local group members of Remote Management Users"]='net group "Remote Management Users" /domain'
all_commands["get local group members of Remote Desktop Users"]='net group "Remote Desktop Users" /domain'
all_commands["get local group members of Backup Operators"]='net group "Backup Operators" /domain'
all_commands["get local group members of Remote Desktop Users"]='net group "Remote Desktop Users" /domain'
all_commands["dir Users"]='dir C:\\Users'
all_commands["systeminfo"]='systeminfo | findstr /B /C:"OS Name" /C:"OS Version"'
all_commands["ver"]='ver'
all_commands["find files with the name cred"]='dir n:\*cred* /s /b'
all_commands["find files with the name secret"]='dir n:\*secret* /s /b'
all_commands["find words with cred"]='findstr /s /i cred n:\*.*'
all_commands["find words with secret"]='findstr /s /i cresecretd n:\*.*'
all_commands["net_admins"]='net localgroup Administrators'
all_commands["check user sessions"]='query user'
all_commands["search for services"]='wmic service get name,displayname,pathname,startmode |findstr /i "auto"|findstr /i /v "C:\windows\\"'
all_commands["search for security user logs"]='wevtutil qe Security /rd:true /f:text | Select-String "Process Command Line"'
all_commands["check all log categories"]='wevtutil el'

commands_oneline=""

create_commands_oneliner() {
    for title in "${!all_commands[@]}"; do
        command="${all_commands["${title}"]}"
        commands_oneline+="@echo ${title}: && ${command} && echo. && "
    done
}

create_commands_oneliner

execute_command "${commands_oneline}"
create_new_line
