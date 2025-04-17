#!/bin/bash

: '
SSI: echo variables
'

execute_command "<!--#echo var=\"DOCUMENT_NAME\" var=\"DOCUMENT_URI\" var=\"LAST_MODIFIED\" var=\"DATE_LOCAL\" -->"
