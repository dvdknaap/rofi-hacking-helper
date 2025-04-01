 #!/bin/bash

: '
Crack SPN passwords with hashcat and OneRuleToRuleThemAll.rule.
'

source "${SCRIPTS_DIR}/crackPasswords/hashcat/.files/crack_hashcat_method.sh"

crack_hashcat_method "13100" "${SCRIPTS_DIR}/crackPasswords/hashcat/.rules/OneRuleToRuleThemAll.rule"
