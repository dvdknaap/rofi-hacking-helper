 #!/bin/bash

: '
Crack JWT (JSON Web Token) string
'

source "${SCRIPTS_DIR}/crackPasswords/hashcat/.files/crack_hashcat_method.sh"

crack_hashcat_method "16500"
