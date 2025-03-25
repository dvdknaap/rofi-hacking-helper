#!/bin/bash

: '
Fix shell to fully interactive shell
'

# Wait a bit to get focus
sleep 0.5

python_pty_spawn="if command -v python3 &>/dev/null; then python3 -c 'import pty; pty.spawn(\"/bin/bash\")'; else python -c 'import pty; pty.spawn(\"/bin/bash\")'; fi"

# Run a command on the remote shell to determine if python3 is available
paste_command "${python_pty_spawn}"
xdotool key Return
sleep 0.5

xdotool key ctrl+z
sleep 0.5

paste_command "stty raw -echo"
xdotool key Return
sleep 1

paste_command "fg"
xdotool key Return
sleep 1

paste_command "export SHELL=bash"
xdotool key Return
sleep 1

paste_command "export TERM=xterm-256color"
xdotool key Return
sleep 1

# Hard coded because rofi isn't loading a terminal environment
rows=52
cols=238

paste_command "stty rows $rows columns $cols"
xdotool key Return
sleep 1

paste_command "reset"
xdotool key Return
sleep 1

# Run a pty spwan againt to make it fully interactive
paste_command "${python_pty_spawn}"
xdotool key Return
sleep 1
