#!/bin/bash

# Function to check if a package is installed and install it if missing
check_and_install_package() {
    local package="$1"

    if [[ -z "$package" ]]; then
        echo "Usage: check_and_install_package <package_name>"
        return 1
    fi

    echo "Checking if '$package' is installed..."
    if ! command -v "$package" &>/dev/null; then
        echo "'$package' is not installed. Installing..."
        sudo apt update && sudo apt install -y "$package"
    else
        echo "'$package' is already installed."
    fi
}

# Function to clone or update the repository
clone_or_update_repo() {
    local repo_url="https://github.com/dvdknaap/rofi-hacking-helper.git"
    local target_dir="$HOME/Desktop/base"

    if [ -d "$target_dir" ]; then
        echo "Target directory $target_dir already exists. Pulling latest changes..."
        git -C "$target_dir" pull
    else
        echo "Cloning repository to $target_dir..."
        git clone "$repo_url" "$target_dir"
    fi
}

# Function to set up a keyboard shortcut using XFCE
setup_xfce_shortcut() {
    local shortcut_command="$1"
    local keybind="$2"

    echo "Setting up keyboard shortcut..."
    xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Shift>m" -t string -s "bash -e '$shortcut_command'" --create

    if [ $? -eq 0 ]; then
        echo -e "\e[32mShortcut successfully created! Use $keybind to launch the menu.\e[0m"
    else
        echo -e "\e[31mFailed to create shortcut. Please check your XFCE settings manually.\e[0m"
    fi
}

# Function to check if a keybinding already exists using gsettings
check_gsettings_keybinding() {
    local search_command="$1"

    echo "Checking if keybinding with command '$search_command' already exists..."
    local keybindings
    keybindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | tr -d "[],'")

    for key in $keybindings; do
        local key_path="org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.$key"
        local command
        command=$(gsettings get "$key_path" command | tr -d "'")

        if [[ "$command" == *"$search_command" ]]; then
            echo -e "\e[32mKeybinding already exists:\e[0m $command"
            return 0
        fi
    done

    echo -e "\e[33mNo existing keybinding found for command '$search_command'.\e[0m"
    return 1
}

# Main function to execute the script steps
main() {
    local shortcut_command="$HOME/Desktop/base/code/xdotool/rofisearch_scripts_menu.sh"
    local keybind="Ctrl+Shift+M"

    check_and_install_package rofi
    check_and_install_package xdotool
    check_and_install_package python3
    check_and_install_package python3-tk
    check_and_install_package powershell
    check_and_install_package xclip
    check_and_install_package expect
    check_and_install_package seclists

    pip3 install pyftpdlib --break-system-packages
    pip3 install sv-ttk --break-system-packages
    pip3 install darkdetect --break-system-packages
    pip3 install git-dumper --break-system-packages
    pip3 install pyftpdlib --break-system-packages

    clone_or_update_repo

    # Check for existing keybinding
    check_gsettings_keybinding "$shortcut_command"
    if [ $? -ne 0 ]; then
        setup_xfce_shortcut "$shortcut_command" "$keybind"
    else
        echo "Keybinding setup skipped as it already exists."
    fi

    echo -e "\n\e[32mSetup is complete. You can now use the ROFI menu with $keybind in your terminal.\e[0m"
}

# Run the main function
main
