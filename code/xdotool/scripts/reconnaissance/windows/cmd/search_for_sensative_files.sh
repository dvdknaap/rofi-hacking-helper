#!/bin/bash

: '
search for sensative files
'

execute_command "findstr /SIM /C:\"password\" *.txt *.ini *.cfg *.config *.xml *.git *.ps1 *.yml"
create_new_line
