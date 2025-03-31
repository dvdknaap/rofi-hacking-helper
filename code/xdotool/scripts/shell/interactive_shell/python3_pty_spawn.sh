#!/bin/bash

: '
python3 - pyt.spawn
'

paste_command "python3 -c 'import pty; pty.spawn(\"/bin/bash\")'"
xdotool key Return