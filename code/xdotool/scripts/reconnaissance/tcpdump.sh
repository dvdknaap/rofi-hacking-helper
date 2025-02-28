#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='tcpdump -i ens192 -s 65535 -w ilfreight_pcap'
paste_command "${command}"
