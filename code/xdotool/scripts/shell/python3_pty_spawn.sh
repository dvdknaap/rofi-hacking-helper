#!/bin/bash

: '
python3 - pyt.spawn
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "python3 -c 'import pty; pty.spawn(\"/bin/bash\")'"
xdotool key Return