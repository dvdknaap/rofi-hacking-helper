#!/bin/bash

: '
SSTI - get jinja2 config info
'

execute_command "{{ config.items() }}"
create_new_line
