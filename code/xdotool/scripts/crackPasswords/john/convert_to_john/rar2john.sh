 #!/bin/bash

: '
covert rar to john format
'

source "${SCRIPTS_DIR}/crackPasswords/john/convert_to_john/.files/convert_to_john.sh"

convert_to_john "rar2john"
