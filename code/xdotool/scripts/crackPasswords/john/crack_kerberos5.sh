 #!/bin/bash

: '
crack Kerberos 5 password hashes
'

source "${SCRIPTS_DIR}/crackPasswords/john/.files/crack_format.sh"

crack_format "krb5"
