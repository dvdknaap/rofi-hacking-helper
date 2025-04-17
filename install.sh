#!/bin/bash

# Set base directory
ROOT_DIR="${1}"
START_DOC="${2:-"1"}"

# Function to check if a package is installed and install it if missing
check_and_install_packages() {
    if [[ $# -eq 0 ]]; then
        show_info_notify_message "Usage: install_packages <package1> <package2> ..."
        return 1
    fi

    echo "install apt-get programs $@"
    sudo DEBIAN_FRONTEND=noninteractive apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y "$@" && sudo apt autoremove -y && sudo apt clean
}

# Function to install pip3 packages
install_pip3_packages() {
    if [[ $# -eq 0 ]]; then
        show_info_notify_message "Usage: install_pip3_packages <package1> <package2> ..."
        return 1
    fi

    echo "install pip3 packages $@"
    pip3 install "$@" --break-system-packages
}

# Function to clone or update the repository
clone_or_update_repo() {
    local repo_url="https://github.com/dvdknaap/rofi-hacking-helper.git"

    if [ -d "${ROOT_DIR}/.git" ]; then
        echo "Target directory ${ROOT_DIR} already exists. Pulling latest changes..."
        git -C "${ROOT_DIR}" pull
    else
        echo "Cloning repository to ${ROOT_DIR}..."
        git clone "${repo_url}" "${ROOT_DIR}"
    fi
}


# Function to set up a keyboard shortcut using XFCE
setup_xfce_shortcut() {
    local shortcut_command="$1"
    local keybind="$2"
    local letter="$3"

    if command -v xfconf-query > /dev/null 2>&1; then
        echo "Setting up keyboard shortcut..."
        xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Shift>${letter}" -t string -s "${shortcut_command}" --create

        if [ $? -eq 0 ]; then
            echo -e "\e[32mShortcut successfully created! Use ${keybind} to launch the menu.\e[0m"
        else
            show_error_notify_message "Failed to create shortcut. Please check your XFCE settings manually."
            echo -e "\e[31mFailed to create shortcut. Please check your XFCE settings manually.\e[0m"
        fi
    else
        echo "xfconf-query not found"
    fi
}

# Function to check if a keybinding already exists using gsettings
setup_gnome_binding() {
    local shortcut_name="$1"
    local shortcut_command="$2"
    local shortcut_keybind="$3"

    if command -v gsettings > /dev/null 2>&1; then
        local found_binding="0"
        local keybindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | tr -d "[],'")

        for key in $keybindings; do
            if [[ "@as" == "${key}" ]]; then
                continue
            fi

            local key_path="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${key}"
            local name=$(gsettings get "${key_path}" name | tr -d "'")
            
            # /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/
            if [[ "${name}" == *"${shortcut_name}" ]]; then
                local command=$(gsettings get "${key_path}" command | tr -d "'")
                local binding=$(gsettings get "${key_path}" binding | tr -d "'")

                if [[ "${command}" != *"${shortcut_command}" ]]; then
                    gsettings set "${key_path}" command "${shortcut_command}"
                    return 0
                fi

                if [[ "${binding}" != *"${shortcut_keybind}" ]]; then
                    gsettings set "${key_path}" binding "${shortcut_keybind}"
                    return 0
                fi

                found_binding="1"
                break;
            fi
        done

        if [[ "${found_binding}" == "0" ]]; then
            local new_custom_key="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/${shortcut_name}/"
            local key_path="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${new_custom_key}"
            local keybindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | tr -d "[],'")
            local new_custom_keybindings="["

            for key in $keybindings; do
                if [[ "@as" == "${key}" ]]; then
                    continue
                fi

                new_custom_keybindings+="'${key}',"
            done

            new_custom_keybindings+="'${new_custom_key}'"
            new_custom_keybindings+="]"

            gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "${new_custom_keybindings}"
            gsettings set "${key_path}" name "${shortcut_name}"
            gsettings set "${key_path}" command "${shortcut_command}"
            gsettings set "${key_path}" binding "${shortcut_keybind}"
        fi
    else
        echo "gsettings not found"
    fi

    return 1
}

# create python3 venv folder
create_python3_venv() {
    local local_location="${1}"
    local venv_folder_name="${2}"
    local start_file="${3}"
    local user_bin_file="/usr/local/bin/${4}"

    cd "${local_location}"
    python3 -m venv "${venv_folder_name}"

    if [ -f "requirements.txt" ];
        .venv/bin/pip3 install -r requirements.txt
    fi

    sudo chmod +x "${local_location}/${start_file}"
    
    command="${local_location}/${venv_folder_name}/bin/python3 ${local_location}/${start_file}"
    
    if [ ! -f "${user_bin_file}" ];
        echo '#!/bin/bash' | sudo tee -a "${user_bin_file}"
        echo "${command}" | sudo tee -a "${user_bin_file}"
    if
}

# install SSTImap
install_stti_map() {
    local local_location="/opt/SSTImap"
    local venv_folder_name=".venv"
    local start_file="sstimap.py"
    local user_bin_file="sstimap"

    sudo git clone https://github.com/vladko312/SSTImap "${local_location}"

    create_python3_venv "${local_location}" "${venv_folder_name}" "${start_file}" "${user_bin_file}"
}

# install gopherus
install_gopherus() {
  local local_location="/opt/Gopherus"
  sudo git clone https://github.com/tarunkant/Gopherus.git "${local_location}"
  sudo chmod +x "${local_location}/gopherus.py"
  sudo ln -sf "${local_location}/gopherus.py" /usr/local/bin/gopherus
}

# Main function to execute the script steps
main() {
    # create folder and give the correct permissions
    sudo mkdir -p "${ROOT_DIR}"
    sudo chown "$(whoami)":"$(whoami)" "${ROOT_DIR}" -R
    cd "${ROOT_DIR}"

    # clone or update repo
    clone_or_update_repo

    # Install required programs
    check_and_install_packages python3 python3-pip x11-utils wget curl
    check_and_install_packages firefox-esr git rofi xdotool libnotify-bin python3-tk
    check_and_install_packages powershell xclip expect seclists jq onesixtyone braa wafw00f nikto finalrecon
    check_and_install_packages imagemagick evil-winrm crackmapexec krb5-user python3-impacket rlwrap 
    check_and_install_packages python3-impacket bloodyad pipx ruby-full feroxbuster ffuf

    # install pip3 packages
    install_pip3_packages setuptools pyftpdlib sv-ttk darkdetect git-dumper uploadserver wsgidav 
    install_pip3_packages cheroot defaultcreds-cheat-sheet pypykatz fuzzywuzzy shodan argparse requests

    # install pipx packages
    pipx_install=$(pipx install git+https://github.com/yaap7/ldapsearch-ad --force)

    # install SSTI map
    install_stti_map

    # install gopherus
    install_gopherus

    ls -alF "${ROOT_DIR}"

    XDOTOOL_DIR="${ROOT_DIR}/code/xdotool"
    CACHE_DIR="${XDOTOOL_DIR}/var/cache"
    UPDATE_CHECK_FILE="${CACHE_DIR}/.rofi_last_update_check"

    if [ ! -d "${CACHE_DIR}" ]; then
        mkdir -p "${CACHE_DIR}"
    fi

    source "${XDOTOOL_DIR}/env.sh"
    
    local helper_name="rofi-hacking-helper"
    local helper_shortcut_command="bash -i -c \"cd ${ROOT_DIR} && source ${XDOTOOL_DIR}/env.sh && source ${XDOTOOL_DIR}/scriptSearcher.sh\""
    local helper_keybind="M"

    local screenshot_name="rofi-hacking-helper-screenshot"
    local screenshot_shortcut_command="bash -i -c \"cd ${ROOT_DIR} && source ${XDOTOOL_DIR}/env.sh && source ${XDOTOOL_DIR}/createScreenshot.sh\""
    local screenshot_keybind="N"

    # Check for existing keybinding
    setup_xfce_shortcut "${helper_shortcut_command}" "Ctrl+Shift+${helper_keybind}" "m"
    setup_gnome_binding "${helper_name}" "${helper_shortcut_command}" "<Shift><Control>${helper_keybind}"

    # Check for existing keybinding
    setup_xfce_shortcut "${screenshot_shortcut_command}" "Ctrl+Shift+${screenshot_keybind}" "n"
    setup_gnome_binding "${screenshot_name}" "${screenshot_shortcut_command}" "<Shift><Control>${screenshot_keybind}"

    if [ ! -f "${XDOTOOL_DIR}/settings.sh" ]; then
        cp "${XDOTOOL_DIR}/settings_example.sh" "${XDOTOOL_DIR}/settings.sh"
        echo -e "\e[32mSettings file created ${XDOTOOL_DIR}/settings.sh.\e[0m"
    fi

    local NOW=$(date +%s)
    echo "${NOW}" > "${UPDATE_CHECK_FILE}"
    
    if [[ "${START_DOC}" == "1" ]]; then
        sleep 0.8
        firefox "${ROOT_DIR}/documentation/index.html" &
    fi
    
    show_success_notify_message "Setup is complete. You can now use the ROFI menu with Ctrl+Shift+${helper_keybind} "m" in your terminal."
    echo -e "\n\e[32mSetup is complete. You can now use the ROFI menu with  Ctrl+Shift+${helper_keybind} in your terminal\nIf the menu isn't showing up logout and login again.\e[0m"
}

# Run the main function
main
