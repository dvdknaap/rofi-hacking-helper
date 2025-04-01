#!/bin/bash

get_dns_record() {
    local dns_type="${1}"

    # Generate GUI form items (label, type (optional: default text), name, default (optional))
    DOMAIN_FIELD=$(form_item "domain" "domain")

    # Generate GUI form
    generate_form "${DOMAIN_FIELD}"

    DOMAIN=${form_data["domain"]}

    execute_command "dig ${dns_type} ${DOMAIN}"
    create_new_line
}
