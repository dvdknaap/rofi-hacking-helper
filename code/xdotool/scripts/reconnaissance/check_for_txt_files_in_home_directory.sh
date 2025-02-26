command='find /home/* -type f -name "*.txt" -o ! -name "*.*"'
xdotool type "${command}"
