 #!/bin/bash

: '
crack zip (winzip) hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "zip"
