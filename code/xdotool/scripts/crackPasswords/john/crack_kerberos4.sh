 #!/bin/bash

: '
crack Kerberos 4 password hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "krb4"
