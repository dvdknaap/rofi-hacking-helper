#!/bin/bash

ip_output=""
if ip link show tun0 &> /dev/null; then
  ip_output=$(ip -o -4 addr show tun0 | awk '{print $4}' | cut -d/ -f1)
elif ip link show eth0 &> /dev/null; then
  ip_output=$(ip -o -4 addr show eth0 | awk '{print $4}' | cut -d/ -f1)
else
  ip_output="NO_IP"
fi

export KALI_IP=${ip_output}
