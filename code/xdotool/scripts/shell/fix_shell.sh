#!/bin/bash

: '
Fix shell to fully interactive shell
'

# Wait a bit to get focus
sleep 0.5

python_pty_spawn="if command -v python3 &>/dev/null; then python3 -c 'import pty; pty.spawn(\"/bin/bash\")'; else python -c 'import pty; pty.spawn(\"/bin/bash\")'; fi"

# Run a command on the remote shell to determine if python3 is available
execute_command "${python_pty_spawn}"
create_new_line
sleep 0.5

xdotool key ctrl+z
sleep 0.5

execute_command "stty raw -echo"
create_new_line
sleep 1

execute_command "fg"
create_new_line
sleep 1

execute_command "export SHELL=bash"
create_new_line
sleep 1

execute_command "export TERM=xterm-256color"
create_new_line
sleep 1

# Hard coded because rofi isn't loading a terminal environment
rows=52
cols=238

execute_command "stty rows $rows columns $cols"
create_new_line
sleep 1

execute_command "reset"
create_new_line
sleep 1

# Run a pty spwan againt to make it fully interactive
execute_command "${python_pty_spawn}"
create_new_line
sleep 1
