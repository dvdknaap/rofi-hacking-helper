#!/bin/bash

: '
sniff for traffic with tcpdump and save to pcap file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "tcpdump -i eth0 -vv -w test.pcap"