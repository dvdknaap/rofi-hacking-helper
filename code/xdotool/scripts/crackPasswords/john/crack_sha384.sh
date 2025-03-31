 #!/bin/bash

: '
crack sha384 hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "sha384"
