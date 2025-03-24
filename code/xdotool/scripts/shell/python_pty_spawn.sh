#!/bin/bash

: '
python - pyt.spawn
'

paste_command "python -c 'import pty; pty.spawn(\"/bin/bash\")'"
xdotool key Return