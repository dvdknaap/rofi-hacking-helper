command=$(cat <<'EOF'
proxychains showmount -e 172.16.8.20
EOF
)
xdotool type "${command}"
