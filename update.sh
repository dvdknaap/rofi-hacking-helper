#!/bin/bash

# Set base directory
BASEDIR=~/Desktop/base
XDOTOOL_DIR="${BASEDIR}/code/xdotool"

source "${XDOTOOL_DIR}/helpers/paste_commands.sh"

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

# pull latest git version
pull_latest_git_version() {
    cd "$BASEDIR"

    git checkout main
    git fetch origin
    git pull origin main
}

# Main function to execute the script steps
main() {
    pull_latest_git_version

    check_and_install_package rofi
    check_and_install_package xdotool
    check_and_install_package python3
    check_and_install_package python3-tk
    check_and_install_package powershell
    check_and_install_package xclip
    check_and_install_package expect

    pip3 install pyftpdlib --break-system-packages
    pip3 install sv-ttk --break-system-packages
    pip3 install darkdetect --break-system-packages

    paste_command "# Update complete!"
    echo -e "\n\e[32mUpdate is complete.\e[0m"
}

# Run the main function
main
