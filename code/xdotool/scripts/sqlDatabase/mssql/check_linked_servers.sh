#!/bin/bash

: '
check current username
'

execute_command "SELECT srvname, isremote FROM sysservers"
create_new_line
