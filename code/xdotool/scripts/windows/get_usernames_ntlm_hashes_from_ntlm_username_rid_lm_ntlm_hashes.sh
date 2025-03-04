 #!/bin/bash

"""
save username and ntlm hashes in seperated files from form username:RID:LM:NTLM:::
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "NTLM_FILE='hashes.txt'; cat \$NTLM_FILE | cut -d ':' -f 1 > documentation/evidence/notes/ad_usernames.txt; cat \$NTLM_FILE | cut -d ':' -f 4 > documentation/evidence/notes/ad_hashes.txt"
