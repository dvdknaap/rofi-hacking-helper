 #!/bin/bash

"""
Format username:RID:LM:NTLM::: to hashcat format
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "cat dump.txt | cut -d ':' -f 1,4 > hashes.txt"
