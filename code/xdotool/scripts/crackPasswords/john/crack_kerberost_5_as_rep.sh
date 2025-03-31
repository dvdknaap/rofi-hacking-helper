 #!/bin/bash

: '
crack krb 5 as rep hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "krb5asrep"
