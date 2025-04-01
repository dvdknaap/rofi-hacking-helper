#!/bin/bash

: '
search for sensative files
'

paste_command "findstr /SIM /C:\"password\" *.txt *.ini *.cfg *.config *.xml *.git *.ps1 *.yml"
xdotool key Return
