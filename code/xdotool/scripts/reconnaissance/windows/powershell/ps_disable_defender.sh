#!/bin/bash

: '
Disable defender
'

execute_command "Set-MpPreference -DisableRealtimeMonitoring \$true -DisableScriptScanning \$true -DisableBehaviorMonitoring \$true -DisableIOAVProtection \$true -DisableIntrusionPreventionSystem \$true"
create_new_line
