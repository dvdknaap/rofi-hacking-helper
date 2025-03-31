 #!/bin/bash

: '
covert keepass to john format
'

source "${SCRIPTS_DIR}/crackPasswords/john/convert_to_john/.files/convert_to_john.sh"

convert_to_john "keepass2john"
