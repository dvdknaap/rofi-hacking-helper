 #!/bin/bash

: '
covert ssh to john format
'

source "${SCRIPTS_DIR}/crackPasswords/john/convert_to_john/.files/convert_to_john.sh"

convert_to_john "ssh2john"
