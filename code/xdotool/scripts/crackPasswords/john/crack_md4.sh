 #!/bin/bash

: '
crack md4 hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "raw-md4"
