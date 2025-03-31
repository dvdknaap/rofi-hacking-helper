 #!/bin/bash

: '
crack Traditional Unix crypt(3) hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "crypt"
