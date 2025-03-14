#!/bin/bash

: '
Disable defender
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Set-MpPreference -DisableRealtimeMonitoring \$true -DisableScriptScanning \$true -DisableBehaviorMonitoring \$true -DisableIOAVProtection \$true -DisableIntrusionPreventionSystem \$true"