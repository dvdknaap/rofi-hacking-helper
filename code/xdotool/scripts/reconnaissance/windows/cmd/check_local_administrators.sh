#!/bin/bash

: '
Net: Check local administrators
'

paste_command "net localgroup administrators"
xdotool key Return
