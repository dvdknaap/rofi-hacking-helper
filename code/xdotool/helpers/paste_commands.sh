#!/bin/bash

paste_command() {
    local command="$1"

    # Wait a bit to get focus
    sleep 0.5

    # Detect OS
    case "$(uname -s)" in
        Linux*)
            if grep -q Microsoft /proc/version &>/dev/null; then
                CLIPBOARD_OLD=$(powershell.exe Get-Clipboard | tr -d '\r')
                echo -n "$command" | clip.exe
                
                xdotool key Shift+v

                echo -n "$CLIPBOARD_OLD" | clip.exe
            else
            
                CLIPBOARD_OLD=$(xclip -o -selection clipboard)
                echo -n "$command" | xclip -selection clipboard

                # Detect active window class
                ACTIVE_WINDOW_ID=$(xdotool getactivewindow)
                WINDOW_CLASS=$(xprop -id "$ACTIVE_WINDOW_ID" | grep "WM_CLASS" | awk -F '"' '{print $2}' | tr '[:upper:]' '[:lower:]')
                
                if [[ "$WINDOW_CLASS" =~ (terminal|konsole|gnome-terminal|xfce4-terminal|alacritty|xterm|tilix|mate-terminal|terminator|warp|xfreerdp|xfreerdp3) ]]; then
                    xdotool key ctrl+Shift+v  # Terminal
                else
                    xdotool key ctrl+v  # GUI-apps
                fi

                echo -n "$CLIPBOARD_OLD" | xclip -selection clipboard
            fi
            ;;
        Darwin*)
            CLIPBOARD_OLD=$(pbpaste)
            echo -n "$command" | pbcopy
            osascript -e 'tell application "System Events" to keystroke "v" using command down'
            echo -n "$CLIPBOARD_OLD" | pbcopy
            ;;
        CYGWIN*|MINGW*|MSYS*)
            CLIPBOARD_OLD=$(powershell.exe Get-Clipboard | tr -d '\r')
            echo -n "$command" | clip.exe
        
            xdotool key ctrl+v
            
            echo -n "$CLIPBOARD_OLD" | clip.exe
            ;;
        *)
            xdotool type "Unsupported OS"
            return 1
            ;;
    esac

    # Wait a bit to get focus
    sleep 0.5
}
