 #!/bin/bash

: '
Crack Kerberos 5, etype 23, AS-REP hashes with hashcat.
'

source "${SCRIPTS_DIR}/crackPasswords/hashcat/.files/crack_hashcat_method.sh"

crack_hashcat_method "18200"
