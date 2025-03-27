#!/bin/bash

: '
listen for ping response
'

paste_command "sudo tcpdump -i tun0 icmp"
xdotool key Return
