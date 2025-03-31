 #!/bin/bash

: '
crack mysql hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "mysql"
