#!/bin/bash

HELPER_DIR="$(dirname "${BASH_SOURCE[0]}")"
SCRIPTS_DIR="${HELPER_DIR/helpers/scripts}"

source "${HELPER_DIR}/find_and_replace_in_file.sh"
source "${HELPER_DIR}/generate_gui_form.sh"
source "${HELPER_DIR}/get_kali_ip.sh"
source "${HELPER_DIR}/paste_commands.sh"
source "${HELPER_DIR}/run_with_proxychains.sh"
source "${HELPER_DIR}/powershell.sh"
source "${HELPER_DIR}/cmd.sh"
source "${HELPER_DIR}/linux.sh"