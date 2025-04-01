#!/bin/bash

: '
find - get interactive shell
'

execute_command "find / -name nameoffile -exec /bin/awk 'BEGIN {system(\"/bin/sh\")}' \;"
create_new_line
