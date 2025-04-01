#!/bin/bash

: '
python - pyt.spawn
'

execute_command "python -c 'import pty; pty.spawn(\"/bin/bash\")'"
create_new_line
