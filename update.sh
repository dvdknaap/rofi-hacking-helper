#!/bin/bash

# Set base directory
REAL_PATH="$(realpath "$0")"
ROOT_DIR="$(dirname "${REAL_PATH}")"
XDOTOOL_DIR="${ROOT_DIR}/code/xdotool"
CACHE_DIR="${XDOTOOL_DIR}/var/cache"
UPDATE_CHECK_FILE="${CACHE_DIR}/.rofi_last_update_check"

source "${XDOTOOL_DIR}/env.sh"

# Function to check if a package is installed and install it if missing
check_and_install_packages() {
    if [[ $# -eq 0 ]]; then
        show_info_notify_message "Usage: check_and_install_packages <package1> <package2> ..."
        return 1
    fi

    sudo apt-get update && sudo apt-get install -y "$@" && sudo apt autoremove -y && sudo apt clean
}

# Function to install pip3 packages
install_pip3_packages() {
    if [[ $# -eq 0 ]]; then
        show_info_notify_message "Usage: install_pip3_packages <package1> <package2> ..."
        echo "Usage: install_pip3_packages <package1> <package2> ..."
        return 1
    fi

    pip3 install "$@" --break-system-packages
}

# pull latest git version
pull_latest_git_version() {
    cd "${ROOT_DIR}"

    git fetch origin &>/dev/null
    LOCAL=$(git rev-parse HEAD)
    REMOTE=$(git rev-parse origin/main)

    if [[ "${LOCAL}" != "${REMOTE}" ]]; then
        git checkout main
        git fetch origin
        git pull origin main

        # we got changes so exit script and start update script again
        bash ./update.sh
        exit 1
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
    fi
}

# Function to check if a keybinding already exists using gsettings
setup_gnome_binding() {
    local shortcut_name="$1"
    local shortcut_command="$2"
    local shortcut_keybind="$3"

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

    return 1
}

# install gopherus
install_gopherus() {
  local local_location="/opt/Gopherus/"
  sudo gite clone https://github.com/tarunkant/Gopherus.git "${local_location}"
  sudo chmod +x "${local_location}/gopherus.py"
  ln -sf "${local_location}/gopherus.py" /usr/local/bin/gopherus
}

# Main function to execute the script steps
main() {
    local helper_name="rofi-hacking-helper"
    local helper_shortcut_command="bash -i -c \"cd ${ROOT_DIR} && source ${XDOTOOL_DIR}/env.sh && source ${XDOTOOL_DIR}/scriptSearcher.sh\""
    local helper_keybind="M"

    local screenshot_name="rofi-hacking-helper-screenshot"
    local screenshot_shortcut_command="bash -i -c \"cd ${ROOT_DIR} && source ${XDOTOOL_DIR}/env.sh && source ${XDOTOOL_DIR}/createScreenshot.sh\""
    local screenshot_keybind="N"
    
    # create folder and give the correct permissions
    sudo mkdir -p "${ROOT_DIR}"
    sudo chown "$(whoami)":"$(whoami)" "${ROOT_DIR}" -R
    cd "${ROOT_DIR}"    

    if [ ! -d "${CACHE_DIR}" ]; then
        mkdir -p "${CACHE_DIR}"
    fi

    # get latest update repo
    pull_latest_git_version

    # Install required programs
    check_and_install_packages python3 python3-pip x11-utils
    check_and_install_packages firefox-esr git rofi xdotool libnotify-bin python3-tk
    check_and_install_packages powershell xclip expect seclists jq onesixtyone braa wafw00f nikto finalrecon
    check_and_install_packages imagemagick evil-winrm crackmapexec krb5-user python3-impacket rlwrap 
    check_and_install_packages python3-impacket bloodyad pipx ruby-full feroxbuster ffuf

    # install pip3 packages
    install_pip3_packages setuptools pyftpdlib sv-ttk darkdetect git-dumper uploadserver wsgidav 
    install_pip3_packages cheroot defaultcreds-cheat-sheet pypykatz fuzzywuzzy shodan argparse requests

    # install pipx packages
    pipx_install=$(pipx install git+https://github.com/yaap7/ldapsearch-ad  --force)

    # install gopherus
    install_gopherus

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
    
    show_success_notify_message "Update is complete!"
    echo -e "\n\e[32mUpdate is complete.\e[0m"
    
    sleep 0.8
    firefox "${ROOT_DIR}/documentation/index.html" &
    exit 0
}

# Run the main function
main
