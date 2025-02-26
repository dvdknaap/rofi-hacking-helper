command=$(cat <<'EOF'
cat /etc/exports
EOF
)
xdotool type "${command}"
