 #!/bin/bash

: '
crack sha224 hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "raw-sha224"
