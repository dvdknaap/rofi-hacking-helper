#!/bin/bash
set -e # Stop bij fouten

echo "Entrypoint: Starting Xvfb..."
Xvfb :99 -screen 0 1024x768x16 &
XVFB_PID=$!

export DISPLAY=:99
sleep 3

echo "Entrypoint: Starting Window Manager (fluxbox)..."
fluxbox &
WM_PID=$!
sleep 2 

echo "Entrypoint: Xvfb and WM started. Executing CMD ($@)..."
exec "$@"
