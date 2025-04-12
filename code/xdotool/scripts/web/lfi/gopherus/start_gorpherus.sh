#!/bin/bash

: '
gorpherus: create LFI gopher urls
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PROTOCOL_FIELD=$(form_item "protocol" "select" "protocol" "mysql" "mysql|postgresql|fastcgi|redis|smtp|zabbix|pymemcache|rbmemcache|phpmemcache|dmpmemcache")

# Generate GUI form
generate_form "${PROTOCOL_FIELD}"

PROTOCOL=${form_data["protocol"]}

execute_command "python2.7 /usr/local/bin/gopherus --exploit ${PROTOCOL}"
create_new_line
