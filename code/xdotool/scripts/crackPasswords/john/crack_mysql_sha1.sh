 #!/bin/bash

: '
crack mysql sha1 hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "mysql-sha1"
