 #!/bin/bash

: '
crack Blowfish-based crypt(3) hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "bf"
