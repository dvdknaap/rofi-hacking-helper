#!/bin/bash

: '
perform mini linpeas to get pentest info
'

declare -gA all_commands
all_commands["id"]='id'
all_commands["env"]='env'
all_commands["cat /etc/passwd"]='cat /etc/passwd|grep /home/'
all_commands["ls -alF"]='ls -alF'
all_commands["cat /etc/*-release"]='cat /etc/*-release'
all_commands["sudo -V"]='sudo -V | head -n1'
all_commands["uname -r"]='uname -r'
all_commands["crontabs"]='ls -la /etc/cron.*/ && cat /etc/crontab'
all_commands["database files: .sql, .sqlite, .db"]='for l in $(echo ".sql .sqlite .db .*db .db*");do echo -e "\nDB File extension: " $l; find / -name *$l 2>/dev/null | grep -v "doc\|lib\|headers\|share\|man";done'
all_commands["search for scripts"]='for l in $(echo ".py .pyc .pl .go .jar .c .sh");do echo -e "\nFile extension: " $l; find / -name *$l 2>/dev/null | grep -v "doc\|lib\|headers\|share";done'
all_commands["search for notes"]='find /home/* -type f -name "*.txt" -o ! -name "*.*"'
all_commands["show exports"]='cat /etc/exports'
all_commands["search for config files"]='for l in $(echo ".conf .config .cnf");do echo -e "\nFile extension: " $l; find / -name *$l 2>/dev/null | grep -v "lib\|fonts\|share\|core" ;done'
all_commands["search for passwords in config files"]='for i in $(find / -name "*.cnf" -o -name "*.conf" -o -name "*.config" 2>/dev/null | grep -v "doc\|lib");do echo -e "\nFile: " $i; grep "user\|password\|pass" $i 2>/dev/null | grep -v "\#";done'
all_commands["check for SUID, check gtfobins for something usefull"]='find / -perm -4000 2>/dev/null'
all_commands["search text files in /home: .txt"]='find /home/ -type f -name "*.txt"'
all_commands["show user .bash* content"]='tail -n5 /home/*/.bash*'
all_commands["netstat: check for open ports"]='netstat -tpln'
all_commands["ifconfig"]='ifconfig'
all_commands["firefox stored credentials"]='ls -l ~/.mozilla/firefox/ | grep default'
all_commands["show firefox logins"]='cat ~/.mozilla/firefox/*.default-*/logins.json | jq .'
all_commands["search log files for info"]='for i in $(ls /var/log/* 2>/dev/null);do GREP=$(grep "accepted\|session opened\|session closed\|failure\|failed\|ssh\|password changed\|new user\|delete user\|sudo\|COMMAND\=\|logs" $i 2>/dev/null); if [[ $GREP ]];then echo -e "\n#### Log file: " $i; grep "accepted\|session opened\|session closed\|failure\|failed\|ssh\|password changed\|new user\|delete user\|sudo\|COMMAND\=\|logs" $i 2>/dev/null;fi;done'
all_commands["SSH Private Keys"]='grep -rnw "PRIVATE KEY" /home/* 2>/dev/null | grep ":1"'
all_commands["SSH Public Keys"]='grep -rnw "ssh-rsa" /home/* 2>/dev/null | grep ":1"'
all_commands["cat /etc/hosts"]='cat /etc/hosts'
all_commands["sudo -l"]='sudo -l'
all_commands["check if machine is domain joined"]='ps -ef | grep -i "winbind\|sssd"'
all_commands["search for Files with keytab in the name"]='find / -name *keytab* -ls 2>/dev/null'

commands_oneline=""

create_commands_oneliner() {
    GREEN="\033[1;32m"
    NC='\033[0m'
    
    for title in "${!all_commands[@]}"; do
        command="${all_commands["${title}"]}"
        commands_oneline+="printf \"\n${GREEN}${title}:${NC}\n\";${command};"
    done
}

create_commands_oneliner

execute_command "${commands_oneline}"
create_new_line

