command=$(cat <<'EOF'
IP="10.129.14.128";TARGET_DIR="target-NFS"; mkdir ${TARGET_DIR} && sudo mount -t nfs ${IP}:/ ./${TARGET_DIR}/ -o nolock && cd ${TARGET_DIR} && tree .
EOF
)
xdotool type "${command}"
