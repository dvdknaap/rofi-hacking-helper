#!/bin/bash

: '
perl - get interactive shell
'

paste_command "perl —e 'exec "/bin/sh";'"
xdotool key Return
