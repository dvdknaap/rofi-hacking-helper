 #!/bin/bash

: '
crack md5 hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "raw-md5"
