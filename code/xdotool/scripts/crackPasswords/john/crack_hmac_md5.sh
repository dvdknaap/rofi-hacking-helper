 #!/bin/bash

: '
crack hmac-md5 password hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "hmac-md5"
