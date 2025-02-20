# Pentest productivity hack with rofi
Use Rofi and xdotool to automate typing and run background tasks in Kali. It works in arbitrary applications (RDP session, browser, any shell, etc).

This is skeleton code with a few examples. Everyone is welcome to contribute.

## Installation
### Automated Installation

1. Clone this repository and navigate to it:
```bash
git clone https://github.com/dvdknaap/rofi-hacking-helper.git ~/Desktop/base
cd ~/Desktop/base
```

2. Run the `install.sh` script:
```bash
bash install.sh
```

### Manual Installation

1. Clone this repository and navigate to it:
```bash
git clone https://github.com/dvdknaap/rofi-hacking-helper.git ~/Desktop/base
cd ~/Desktop/base
```

2. Install Rofi if not already installed
``` bash
sudo apt install rofi -y
```

3. Add rofisearch script menu as keyboard shortcut:
- Go to `Settings Manager`->`Keyboard`->`Application Shortcuts` / `Keyboard shortcuts`:
![Settings](assets/settings.png)

- Scroll down and click on `Custom Shortcuts`
![Keyboard ShortCuts](assets/keyboardShortCuts.png)

- Click on add and fill in command and the keyboard shortcut that you want to use

Name: `rofi-hacking-helper`

Command: `/home/username/Desktop/base/code/xdotool/rofisearch_scripts_menu.sh` (change `username` to your username `~/` wont work)

Shurtcut: - Press Ctrl+Shift+M and execute scripts from anywhere

![Custom shortcut](assets/customShortcut.png)

Some example scripts require other tools, like `zenity` or `pwsh`, but the idea is that you manage the scripts yourself.

## What it looks like

![](assets/boon.gif)

### fully automatic fix shell
[Full size video](assets/shellFix.mp4)
<video src='assets/shellFix.mp4' width=1200 />

# TIP
### Add ip,domain and creds and it will automaticly create custom codes that you can use in the rofi menu
[dvdknaap/add-creds-rofi](https://github.com/dvdknaap/add-creds-rofi)

## Limitations
- xdotool doesn't work in Wayland, so this works in Kali but not on Ubuntu.
- Because it's application independant it doesn't share your normal shell aliases.

## Todo
- A generic typing helper would be better to enhance readability. It would also allow adaptation of the scripts to Wayland.

## Other productivity tips
See [productivity tips](Productivity.md) for more general Kali productivity tips.

# Forked and special thanks to @spipm
[spipm/rofi-hacking-helper Repository](https://github.com/spipm/rofi-hacking-helper)

