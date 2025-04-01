 #!/bin/bash

: '
Crack SPN passwords with hashcat and best64.rule.
'

source "${SCRIPTS_DIR}/crackPasswords/hashcat/.files/crack_hashcat_method.sh"

crack_hashcat_method "5600" "/usr/share/hashcat/rules/best64.rule"
