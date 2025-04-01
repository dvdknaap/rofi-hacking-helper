#!/bin/bash

: '
refresh ps -aux list every second
'

execute_command 'watch -n 1 "ps -aux"'
create_new_line
