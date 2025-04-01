 #!/bin/bash

: '
Crack md5 hashes
'

source "${SCRIPTS_DIR}/crackPasswords/hashcat/.files/crack_hashcat_method.sh"

crack_hashcat_method "500"

