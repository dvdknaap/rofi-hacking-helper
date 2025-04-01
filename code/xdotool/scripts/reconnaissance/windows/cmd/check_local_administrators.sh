#!/bin/bash

: '
Net: Check local administrators
'

execute_commandnd "net localgroup administrators"
create_new_line
