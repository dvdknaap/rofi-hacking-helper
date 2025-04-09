#!/bin/bash

get_dns_record() {
    local dns_type="${1}"

    # Generate GUI form items (label, type (optional: default text), name, default (optional))
    DOMAIN_FIELD=$(form_item "domain" "domain")
    NAMESERVER_FIELD=$(form_item "ip" "ip")

    # Generate GUI form
    generate_form "${DOMAIN_FIELD}" "${NAMESERVER_FIELD}"

    DOMAIN=${form_data["domain"]}
    NAMESERVER=${form_data["ip"]}

    execute_command "dig ${dns_type} ${DOMAIN} @${NAMESERVER}"
    create_new_line
}
