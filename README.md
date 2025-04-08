# Pentest Productivity Hacking helper

Automate typing and run background tasks a dynamic menu. 
This tool enhances your productivity by making frequently used scripts and credentials quickly accessible.

[![Deploy static content to Pages](https://github.com/dvdknaap/rofi-hacking-helper/actions/workflows/deploy-static-pages.yml/badge.svg)](https://github.com/dvdknaap/rofi-hacking-helper/actions/workflows/deploy-static-pages.yml)

[![Test HackingHelper Installation](https://github.com/dvdknaap/rofi-hacking-helper/actions/workflows/test-install.yml/badge.svg)](https://github.com/dvdknaap/rofi-hacking-helper/actions/workflows/test-install.yml)

## Features

- Quickly execute pentesting scripts (NetExec, SMB, RDP, WinRM, Metasploit, MSFVenom, BloodHound, web reconnaissance, etc.).
- Store and reuse credentials like IP addresses, domains, usernames, and passwords.
- Create custom fields to store additional information needed for scripts.
- Works in any application with an input field, such as terminals, text editors, and browsers.
- **Launch the tool anytime with `Ctrl+Shift+M`.**
- **Create a screenshot with `Ctrl+Shift+N`.**

## Installation

### Automated Installation

To install the tool automatically, run:

```bash
FOLDER="/opt/rofiHackingHelper"; bash <(curl -s -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/dvdknaap/rofi-hacking-helper/main/install.sh) "${FOLDER}"
```

This script will set up everything, including downloading dependencies.

## Automatic Updates

The tool checks for updates daily and will prompt you when a new version is available.

### Usage
- Open the tool using `Ctrl+Shift+M`.
- Select a script from the menu.
- The selected script will be executed, using stored credentials or user input where required.
- The output will be displayed in the terminal or applied directly, depending on the script.

## Example Use Cases

- **Quickly log in to remote systems** (RDP, SSH, SMB, WinRM, etc.).
- **Automate repetitive typing tasks** in web applications and command-line tools.
- **Generate and execute Metasploit & MSFVenom payloads faster.**

## Documentation

A full list of scripts and functionality can be found [here](https://dvdknaap.github.io/rofi-hacking-helper/).

## Disclaimer

This tool is intended for **legal security testing and educational purposes only**.  
The author is **not responsible** for any misuse or damage caused by this tool.  
Use it only on systems you have **explicit permission** to test.

## Credits

Forked and improved from [spipm/rofi-hacking-helper](https://github.com/spipm/rofi-hacking-helper).
