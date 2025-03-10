#!/bin/bash

# Base settings
BASEDIR=~/Desktop/base
SCRIPTS_DIR="${BASEDIR}/code/xdotool/scripts"
CACHE_FILE="${BASEDIR}/documentation/script_list.md"

mkdir -p "$(dirname "$CACHE_FILE")"

# Function to get description
function get_description {
    local file=$1
    local description=""

    if [[ -f "${file}" ]]; then
        description=$(sed -n "/^: '\$/,/^'\$/{//!p}" "${file}")
    elif [[ -d "${file}" && -f "${file}/.desc" ]]; then
        description=$(cat "${file}/.desc")
    fi

    echo "${description}"
}

# Start fresh Markdown file
echo "" > "$CACHE_FILE"

# List to store root files separately
root_files=()

# Step 1: Process only first-level subdirectories
find "$SCRIPTS_DIR" -mindepth 1 -maxdepth 1 -type d ! -path "*/.*" | sort | while IFS= read -r dir; do
    rel_path="${dir#$SCRIPTS_DIR/}"
    description=$(get_description "$dir")

    # Add section header for first-level subdirectories
    echo -e "### ${rel_path}\n${description}\n" >> "$CACHE_FILE"
    echo -e "| Path | Description |\n|------|-------------|" >> "$CACHE_FILE"

    # Process all files and subdirectories within this first-level directory
    find "$dir" -mindepth 1 ! -path "*/.*" | sort | while IFS= read -r item; do
        rel_item_path="${item#$SCRIPTS_DIR/}"
        description=$(get_description "$item")

        if [[ -d "$item" ]]; then
            # Add subdirectories inside the section, but not as a new section
            echo -e "| 📂 \`$rel_item_path\` | $description |" >> "$CACHE_FILE"
        elif [[ -f "$item" ]]; then
            # Add files with appropriate icons
            case "$item" in
                *.sh) icon="📜" ;;
                *.py) icon="🐍" ;;
                *.pl) icon="🐪" ;;
                *) continue ;;
            esac
            echo -e "| $icon \`$rel_item_path\` | $description |" >> "$CACHE_FILE"
        fi
    done

    # Close the table
    echo "" >> "$CACHE_FILE"
done

# Step 2: Collect root files (not in subdirectories)
find "$SCRIPTS_DIR" -maxdepth 1 -type f ! -path "*/.*" | sort | while IFS= read -r file; do
    rel_path="${file#$SCRIPTS_DIR/}"
    description=$(get_description "$file")

    case "$file" in
        *.sh) icon="📜" ;;
        *.py) icon="🐍" ;;
        *.pl) icon="🐪" ;;
        *) continue ;;
    esac

    root_files+=("| $icon \`$rel_path\` | $description |")
done

# Step 3: Append root files under "Other Scripts" section
if [[ ${#root_files[@]} -gt 0 ]]; then
    echo -e "### Other Scripts\nMiscellaneous scripts in the root folder.\n" >> "$CACHE_FILE"
    echo -e "| Path | Description |\n|------|-------------|" >> "$CACHE_FILE"
    printf "%s\n" "${root_files[@]}" >> "$CACHE_FILE"
    echo "" >> "$CACHE_FILE"
fi

echo "Markdown list generated: ${CACHE_FILE}"
