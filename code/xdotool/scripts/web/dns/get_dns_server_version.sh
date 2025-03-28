#!/bin/bash

: '
dig get DNS server version
'

source "${SCRIPTS_DIR}/web/dns/.files/get_dns_records.sh"

get_dns_record "CH TXT version.bind"
