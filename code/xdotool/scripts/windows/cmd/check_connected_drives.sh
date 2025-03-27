#!/bin/bash

: '
Net: Show connected network drives.
'

paste_command "net use"
xdotool key Return
