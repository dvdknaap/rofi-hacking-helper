#!/bin/bash

# Set base directory
REAL_PATH="$(realpath "$0")"
ROOT_DIR="$(dirname "${REAL_PATH}")"

# Function to check if a package is installed and install it if missing
check_and_install_packages() {
    if [[ $# -eq 0 ]]; then
        show_info_notify_message "Usage: install_packages <package1> <package2> ..."
        return 1
    fi

    sudo apt update && sudo apt install -y "$@"
}

# Function to install pip3 packages
install_pip3_packages() {
    if [[ $# -eq 0 ]]; then
        show_info_notify_message "Usage: install_pip3_packages <package1> <package2> ..."
        return 1
    fi

    pip3 install "$@" --break-system-packages
}

# Function to clone or update the repository
clone_or_update_repo() {
    local repo_url="https://github.com/dvdknaap/rofi-hacking-helper.git"

    if [ -d "${ROOT_DIR}" ]; then
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

    echo "Setting up keyboard shortcut..."
    xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Shift>${letter}" -t string -s "${shortcut_command}" --create

    if [ $? -eq 0 ]; then
        echo -e "\e[32mShortcut successfully created! Use ${keybind} to launch the menu.\e[0m"
    else
        show_error_notify_message "Failed to create shortcut. Please check your XFCE settings manually."
        echo -e "\e[31mFailed to create shortcut. Please check your XFCE settings manually.\e[0m"
    fi
}

# Function to check if a keybinding already exists using gsettings
setup_gnome_binding() {
    local shortcut_name="$1"
    local shortcut_command="$2"
    local shortcut_keybind="$3"

    local found_binding="0"
    local keybindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | tr -d "[],'")

    echo "Checking if keybinding with command '${shortcut_name}' already exists..."

    for key in $keybindings; do
        if [[ "@as" == "${key}" ]]; then
            continue
        fi

        local key_path="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:${key}"
        local name=$(gsettings get "${key_path}" name | tr -d "'")
        
        echo "key_path: ${key_path}"
        echo "name: ${name}"

        # /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/
        if [[ "${name}" == *"${shortcut_name}" ]]; then
            local command=$(gsettings get "${key_path}" command | tr -d "'")
            local binding=$(gsettings get "${key_path}" binding | tr -d "'")

            if [[ "${command}" != *"${search_command}" ]]; then
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

# Main function to execute the script steps
main() {
    local helper_name="rofi-hacking-helper"
    local helper_shortcut_command="bash -i -c \"source ${XDOTOOL_DIR}/env.sh && source ${XDOTOOL_DIR}/rofisearch_scripts_menu.sh\""
    local helper_keybind="M"

    local screenshot_name="rofi-hacking-helper-screenshot"
    local screenshot_shortcut_command="bash -i -c \"source ${XDOTOOL_DIR}/env.sh && source ${XDOTOOL_DIR}/createScreenshot.sh\""
    local screenshot_keybind="N"

    # clone or update repo
    clone_or_update_repo

    XDOTOOL_DIR="${ROOT_DIR}/code/xdotool"

    source "${XDOTOOL_DIR}/env.sh"

    # Check for existing keybinding
    setup_xfce_shortcut "${helper_shortcut_command}" "Ctrl+Shift+${helper_keybind}" "m"
    setup_gnome_binding "${helper_name}" "${helper_shortcut_command}" "<Shift><Control>${helper_keybind}"

    # Check for existing keybinding
    setup_xfce_shortcut "${screenshot_shortcut_command}" "Ctrl+Shift+${screenshot_keybind}" "n"
    setup_gnome_binding "${screenshot_name}" "${screenshot_shortcut_command}" "<Shift><Control>${screenshot_keybind}"

    # Install required programs
    check_and_install_packages rofi xdotool python3 python3-tk powershell xclip expect seclists jq onesixtyone braa wafw00f nikto finalrecon imagemagick evil-winrm crackmapexec

    # install pip3 packages
    install_pip3_packages pyftpdlib sv-ttk darkdetect git-dumper shodan uploadserver wsgidav cheroot defaultcreds-cheat-sheet pypykatz

    if [[ -f "${SCRIPTS_DIR}/settings.sh"]]; then
        cp "${XDOTOOL_DIR}/settings_example.sh" "${XDOTOOL_DIR}/settings.sh"
    fi

    show_success_notify_message "Setup is complete. You can now use the ROFI menu with ${keybind} in your terminal."
    echo -e "\n\e[32mSetup is complete. You can now use the ROFI menu with ${keybind} in your terminal.\e[0m"
}

# Run the main function
main
