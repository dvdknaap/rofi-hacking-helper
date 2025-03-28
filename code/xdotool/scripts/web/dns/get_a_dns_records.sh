#!/bin/bash

: '
dig A domain name
'

source "${SCRIPTS_DIR}/web/dns/.files/get_dns_records.sh"

get_dns_record "A"
