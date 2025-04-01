 #!/bin/bash

: '
Crack NetNTLMv2 hashes with hashcat.
'

source "${SCRIPTS_DIR}/crackPasswords/hashcat/.files/crack_hashcat_method.sh"

crack_hashcat_method "5600"
