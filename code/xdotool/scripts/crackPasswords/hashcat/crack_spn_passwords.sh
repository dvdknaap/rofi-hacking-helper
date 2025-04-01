 #!/bin/bash

: '
Crack SPN passwords with hashcat using rockyou.txt.
'

source "${SCRIPTS_DIR}/crackPasswords/hashcat/.files/crack_hashcat_method.sh"

crack_hashcat_method "13100"
