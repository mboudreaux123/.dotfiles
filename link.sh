#!/bin/bash

# Set the base directory for dotfiles
DOTFILES_DIR="$HOME/.dotfiles"

# Function to create symbolic links
create_symlink() {
    local src_file=$1
    local dest_file=$2

    # Create parent directories for the destination file if they don't exist
    mkdir -p "$(dirname "$dest_file")"

    # Create the symbolic link, overwriting if necessary
    if [ -L "$dest_file" ]; then
        # echo "Overwriting existing symlink: $dest_file"
        rm "$dest_file"
    elif [ -e "$dest_file" ]; then
        echo "Backing up existing file: $dest_file"
        mv "$dest_file" "$dest_file.bak"
    fi

    ln -s "$src_file" "$dest_file"

    # Simplify paths for display
    local src_display="${src_file/$HOME\//~\/}"
    local dest_display="${dest_file/$HOME\//~\/}"
    echo -e "\e[32mLinked\e[0m: $src_display \e[32m-->\e[0m $dest_display"
}

# Iterate over files and directories in the .dotfiles directory
find "$DOTFILES_DIR" -type f \
    ! -path "$DOTFILES_DIR/.git/*" \
    ! -name ".gitignore" \
    ! -name ".gitattributes" \
    ! -name ".DS_Store" \
    ! -name "README.md" \
    ! -name "link.sh" | while read -r src_file; do
    # Remove the base path to determine the relative path
    relative_path="${src_file#$DOTFILES_DIR/}"

    # Determine the destination paths in the user's home directory
    if [[ "$relative_path" == .config/zed/* ]]; then
        # Link to both Flatpak and standard .config paths
        if command -v flatpak > /dev/null && flatpak info dev.zed.Zed > /dev/null 2>&1; then
            dest_file_flatpak="$HOME/.var/app/dev.zed.Zed/config/zed/${relative_path#*.config/zed/}"
            create_symlink "$src_file" "$dest_file_flatpak"
        fi
        dest_file_standard="$HOME/$relative_path"
        create_symlink "$src_file" "$dest_file_standard"
    else
        dest_file="$HOME/$relative_path"
        create_symlink "$src_file" "$dest_file"
    fi

done

# Final message
echo "All dotfiles have been linked successfully."

