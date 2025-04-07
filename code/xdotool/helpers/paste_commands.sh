#!/bin/bash

type_command() {
    local COMMAND="${1}"
    local TYPEING_DELAY="${2:-"${SETTING_TYPING_DELAY}"}"
    local TYPING_CHARACTER_DELAY="${3:-"${SETTING_TYPING_CHARACTER_DELAY}"}"

    if [[ "${TYPEING_DELAY}" > 0 ]]; then
        sleep "${TYPEING_DELAY}"
    fi

    xdotool type --delay "${TYPING_CHARACTER_DELAY}" "${COMMAND}"
    return 0
}

echo_command() {
    local COMMAND="${1}"
    local TYPEING_DELAY="${2:-"${SETTING_TYPING_DELAY}"}"

    if [[ "${TYPEING_DELAY}" > 0 ]]; then
        sleep "${TYPEING_DELAY}"
    fi

    echo "${COMMAND}"
    return 0
}


paste_command() {
    local command="${1}"

    # Wait a bit to get focus
    sleep 0.5

    # Detect OS
    case "$(uname -s)" in
        Linux*)
            if grep -q Microsoft /proc/version &>/dev/null; then
                CLIPBOARD_OLD=$(powershell.exe Get-Clipboard | tr -d '\r')
                echo -n "${command}" | clip.exe

                xdotool key Shift+v

                echo -n "$CLIPBOARD_OLD" | clip.exe
            else
                echo "active window id check"
                # Detect active window class
                ACTIVE_WINDOW_ID=$(xdotool getactivewindow 2>/dev/null)
                EXIT_CODE=$?

                if [[ "${EXIT_CODE}" == "0" && -n "${ACTIVE_WINDOW_ID}" ]]; then
                    echo "found window manager"
                    WINDOW_CLASS=$(xprop -id "${ACTIVE_WINDOW_ID}" | grep "WM_CLASS" | awk -F '"' '{print $2}' | tr '[:upper:]' '[:lower:]')

                    if [[ "${WINDOW_CLASS}" =~ (xfreerdp|xfreerdp3|rdesktop) ]]; then
                        type_command "${command}"
                        return 0
                    fi

                    CLIPBOARD_OLD=$(xclip -o -selection clipboard)
                    echo -n "${command}" | xclip -selection clipboard

                    if [[ "${WINDOW_CLASS}" =~ (gnome.terminal|terminal|konsole|gnome-terminal|xfce4-terminal|alacritty|xterm|tilix|mate-terminal|terminator|warp) ]]; then
                        xdotool key ctrl+Shift+v  # Terminal
                    else
                        xdotool key ctrl+v  # GUI-apps
                    fi

                    echo -n "${CLIPBOARD_OLD}" | xclip -selection clipboard
                else
                    echo "no window manager found: just copy and paste the command: ${command}"
                    type_command "${command}"
                    return 0
                fi
            fi
            ;;
        Darwin*)
            CLIPBOARD_OLD=$(pbpaste)
            echo -n "${command}" | pbcopy
            osascript -e 'tell application "System Events" to keystroke "v" using command down'
            echo -n "${CLIPBOARD_OLD}" | pbcopy
            ;;
        CYGWIN*|MINGW*|MSYS*)
            CLIPBOARD_OLD=$(powershell.exe Get-Clipboard | tr -d '\r')
            echo -n "${command}" | clip.exe
        
            xdotool key ctrl+v

            echo -n "${CLIPBOARD_OLD}" | clip.exe
            ;;
        *)
            xdotool type "Unsupported OS"
            return 1
            ;;
    esac

    # Wait a bit to get focus
    sleep 0.5
}

create_new_line() {
    xdotool key Return
}

execute_command() {
    local COMMAND="${1}"
    local TYPEING_DELAY="${2:-"${SETTING_TYPING_DELAY}"}"
    local TYPING_CHARACTER_DELAY="${3:-"${SETTING_TYPING_CHARACTER_DELAY}"}"
    local EXECUTE_COMMAND_TYPE="${SETTING_EXECUTE_COMMAND_TYPE:-"paste"}"

    case "${EXECUTE_COMMAND_TYPE}" in
        type*)
            type_command "${COMMAND}" "${TYPEING_DELAY}" "${TYPING_CHARACTER_DELAY}"
            ;;
        paste*)
            paste_command "${COMMAND}"
            ;;
        echo*)
            echo_command "${COMMAND}" "${TYPEING_DELAY}"
            ;;
        *)
            xdotool type "Unsupported execute command type setting: '${EXECUTE_COMMAND_TYPE}'"
            return 1
            ;;
    esac
}
