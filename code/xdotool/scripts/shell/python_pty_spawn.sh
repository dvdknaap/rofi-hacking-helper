#!/bin/bash

: '
python - pyt.spawn
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "python -c 'import pty; pty.spawn(\"/bin/bash\")'"
xdotool key Return