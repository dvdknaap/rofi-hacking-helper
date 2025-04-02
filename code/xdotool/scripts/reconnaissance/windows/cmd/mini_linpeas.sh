#!/bin/bash

: '
Perform mini Windows Linpeas to get pentest info
'

declare -gA all_commands
all_commands["whoami"]='whoami /all'
all_commands["net_user"]='net user'
all_commands["dir_CUsers"]='dir C:\\Users'
all_commands["systeminfo"]='systeminfo | findstr /B /C:"OS Name" /C:"OS Version"'
all_commands["ver"]='ver'
all_commands["find files with the name cred"]='dir n:\*cred* /s /b'
all_commands["find files with the name secret"]='dir n:\*secret* /s /b'
all_commands["find words with cred"]='findstr /s /i cred n:\*.*'
all_commands["find words with secret"]='findstr /s /i cresecretd n:\*.*'
all_commands["net_admins"]='net localgroup Administrators'

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
