#!/bin/bash

# Set base directory
BASEDIR=~/Desktop/base
XDOTOOL_DIR="${BASEDIR}/code/xdotool"

source "${XDOTOOL_DIR}/helpers/linux.sh"

# Function to check if a package is installed and install it if missing
check_and_install_package() {
    local package="$1"

    if [[ -z "$package" ]]; then
        show_info_notify_message "Usage: check_and_install_package <package_name>"
        return 1
    fi

    echo "Checking if '${package}' is installed..."
    if ! command -v "${package}" &>/dev/null; then
        echo "'${package}' is not installed. Installing..."
        sudo apt update && sudo apt install -y "${package}"
    fi
}

# Function to install pip3 packages
install_pip3_packages() {
    local package="$1"

    if [[ -z "$package" ]]; then
        show_info_notify_message "Usage: install_pip3_packages <package_name>"
        echo "Usage: install_pip3_packages <package_name>"
        return 1
    fi

    pip3 install "${package}" --break-system-packages
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
    check_and_install_package seclists
    check_and_install_package jq
    check_and_install_package onesixtyone
    check_and_install_package braa
    check_and_install_package wafw00f
    check_and_install_package nikto
    check_and_install_package finalrecon

    install_pip3_packages pyftpdlib
    install_pip3_packages sv-ttk
    install_pip3_packages darkdetect
    install_pip3_packages git-dumper
    install_pip3_packages shodan
    install_pip3_packages uploadserver

    show_success_notify_message "Update is complete!"
    echo -e "\n\e[32mUpdate is complete.\e[0m"
    
    sleep 0.8
    firefox documentation/scripts_list.html
}

# Run the main function
main
