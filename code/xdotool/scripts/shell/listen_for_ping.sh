#!/bin/bash

: '
listen for ping response
'

execute_command "sudo tcpdump -i tun0 icmp"
create_new_line
