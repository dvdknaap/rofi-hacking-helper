#!/bin/bash

: '
python3 - pyt.spawn
'

execute_command "python3 -c 'import pty; pty.spawn(\"/bin/bash\")'"
create_new_line
