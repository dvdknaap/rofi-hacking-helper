#!/bin/bash

: '
perform mini linpeas to get pentest info
'

paste_command "@echo whoami: && whoami /all && echo. && echo net user: && net user && echo. && echo dir C:\Users: && dir C:\Users && echo. && echo systeminfo: && systeminfo | findstr /B /C:"OS Name" /C:"OS Version" && echo. && echo ver: && ver && echo. && echo net localgroup Administrators: && net localgroup Administrators"
xdotool key Return
