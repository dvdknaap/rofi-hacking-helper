 #!/bin/bash

: '
crack pdf hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "pdf"
