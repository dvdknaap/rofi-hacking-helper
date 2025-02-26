command=$(cat <<'EOF'
sudo umount ./target-NFS
EOF
)
xdotool type "${command}"
