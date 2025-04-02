#!/bin/bash

: '
perform mini linpeas to get pentest info (PowerShell version)
'

declare -gA all_commands
all_commands["whoami"]='whoami /all'
all_commands["Get-LocalUser"]='Get-LocalUser'
all_commands["Get-ChildItem C:\Users"]='Get-ChildItem C:\Users'
all_commands["Get-CimInstance Win32_OperatingSystem"]='Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber'
all_commands["[System.Environment]::OSVersion"]='[System.Environment]::OSVersion.VersionString'
all_commands["Get-LocalGroupMember Administrators"]='Get-LocalGroupMember Administrators'
all_commands["search for filenames with cred"]='Get-ChildItem -Recurse -Path N:\ -Include *cred* -File'
all_commands["search for filenames with secret"]='Get-ChildItem -Recurse -Path N:\ -Include *secret* -File'
all_commands["search for file that contains the word cred"]='Get-ChildItem -Recurse -Path N:\ | Select-String "cred" -List'
all_commands["search for file that contains the wordh secret"]='Get-ChildItem -Recurse -Path N:\ | Select-String "secret" -List'
all_commands["check user sessions"]='query user'

commands_oneline=""

create_commands_oneliner() {
    for title in "${!all_commands[@]}"; do
        command="${all_commands["${title}"]}"
        commands_oneline+="Write-Host \"`n${title}:\"; ${command}; "
    done
}

create_commands_oneliner

execute_command "${commands_oneline}"
create_new_line
