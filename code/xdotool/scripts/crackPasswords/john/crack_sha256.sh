 #!/bin/bash

: '
crack sha256 hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "sha256"
