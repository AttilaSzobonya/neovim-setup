#!/bin/bash

# cleanup-packer.sh - Script to clean up old packer installation

echo "Cleaning up old packer.nvim installation..."

# Remove packer compiled files
rm -rf ~/.local/share/nvim/site/pack/packer

# Remove packer start directory if it exists
rm -rf ~/.local/share/nvim/site/pack/packer/start

# Remove packer opt directory if it exists  
rm -rf ~/.local/share/nvim/site/pack/packer/opt

# Remove any packer compiled lua files
find ~/.config/nvim -name "packer_compiled.lua" -delete 2>/dev/null

echo "Packer cleanup complete!"
echo "You can now start Neovim and lazy.nvim will automatically install the plugins."
echo ""
echo "Note: The old core.lua has been backed up as core.lua.bak"
echo "You can remove it once you're satisfied with the new configuration."
