#!/bin/bash

: '
python3: get all printable ascii chars
'

printable=$(python3 -c 'import string;print(string.printable)')

execute_command "${printable}"
create_new_line

