#!/bin/bash

if ip link show tun0 &> /dev/null; then
    export KALI_IP=$(ip -o -4 addr show tun0 | awk '{print $4}' | cut -d/ -f1)
else
	export KALI_IP="NO_IP"
fi