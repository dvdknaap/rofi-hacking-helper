#!/bin/bash

# Set base directory
ROOT_DIR="${HOME}/Desktop/base"
XDOTOOL_DIR="${ROOT_DIR}/code/xdotool"

source "${XDOTOOL_DIR}/env.sh"

# Function to check if a package is installed and install it if missing
install_packages() {
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
        echo "Usage: install_pip3_package s<package1> <package2> ..."
        return 1
    fi

    pip3 install "$@" --break-system-packages
}

# pull latest git version
pull_latest_git_version() {
    cd "${ROOT_DIR}"

    git checkout main
    git fetch origin
    git pull origin main
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
    local helper_shortcut_command="bash -i -c \"source ${ROOT_DIR}/code/xdotool/env.sh && source ${ROOT_DIR}/code/xdotool/rofisearch_scripts_menu.sh\""
    local helper_keybind="M"

    local screenshot_name="rofi-hacking-helper-screenshot"
    local screenshot_shortcut_command="bash -i -c \"source ${ROOT_DIR}/code/xdotool/env.sh && source ${ROOT_DIR}/code/xdotool/createScreenshot.sh\""
    local screenshot_keybind="N"

    # Check for existing keybinding
    setup_xfce_shortcut "${helper_shortcut_command}" "Ctrl+Shift+${helper_keybind}" "m"
    setup_gnome_binding "${helper_name}" "${helper_shortcut_command}" "<Shift><Control>${helper_keybind}"

    # Check for existing keybinding
    setup_xfce_shortcut "${screenshot_shortcut_command}" "Ctrl+Shift+${screenshot_keybind}" "n"
    setup_gnome_binding "${screenshot_name}" "${screenshot_shortcut_command}" "<Shift><Control>${screenshot_keybind}"

    pull_latest_git_version

    # Install required programs
    check_and_install_packages rofi xdotool python3 python3-tk powershell xclip expect seclists jq onesixtyone braa wafw00f nikto finalrecon imagemagick evil-winrm crackmapexec

    # install pip3 packages
    install_pip3_packages pyftpdlib sv-ttk darkdetect git-dumper shodan uploadserver wsgidav cheroot defaultcreds-cheat-sheet

    show_success_notify_message "Update is complete!"
    echo -e "\n\e[32mUpdate is complete.\e[0m"
    
    sleep 0.8
    firefox documentation/scripts_list.html
}

# Run the main function
main
