#!/bin/bash

# validate-config.sh - Quick validation of the new lazy.nvim configuration

echo "Validating Neovim configuration..."
echo ""

# Check if lazy.nvim bootstrap file exists
if [ -f "init.lua" ]; then
    echo "✓ init.lua exists"
else
    echo "✗ init.lua missing"
fi

# Check core files
if [ -f "lua/core/options.lua" ] && [ -f "lua/core/keymaps.lua" ]; then
    echo "✓ Core configuration files exist"
else
    echo "✗ Core configuration files missing"
fi

# Check plugins directory
if [ -d "lua/plugins" ]; then
    plugin_count=$(ls lua/plugins/*.lua 2>/dev/null | wc -l)
    echo "✓ Plugins directory exists with $plugin_count plugin configurations"
else
    echo "✗ Plugins directory missing"
fi

# Check environment files
if [ -d "lua/env" ]; then
    env_count=$(ls lua/env/*.lua 2>/dev/null | wc -l)
    echo "✓ Environment configurations exist ($env_count files)"
else
    echo "✗ Environment configurations missing"
fi

echo ""
echo "Configuration validation complete!"
echo ""

# Check current environment variable
echo "Environment check:"
if [ -z "$NEOVIM_ENVIRONMENT" ]; then
    echo "  NEOVIM_ENVIRONMENT is not set (will use general-dev)"
elif [ "$NEOVIM_ENVIRONMENT" = "" ]; then
    echo "  NEOVIM_ENVIRONMENT is empty (will use general-dev)"
elif [ "$NEOVIM_ENVIRONMENT" = "general-dev" ]; then
    echo "  NEOVIM_ENVIRONMENT = 'general-dev' (general development)"
else
    echo "  NEOVIM_ENVIRONMENT = '$NEOVIM_ENVIRONMENT'"
    if [ -f "lua/env/$NEOVIM_ENVIRONMENT.lua" ]; then
        echo "  ✓ Environment config file exists"
    else
        echo "  ⚠️  Environment config file 'lua/env/$NEOVIM_ENVIRONMENT.lua' not found"
        echo "     Will fallback to general-dev configuration"
    fi
fi
echo ""

echo "To test the configuration:"
echo "1. Run './cleanup-packer.sh' to remove old packer files"
echo "2. Start Neovim - lazy.nvim will automatically install plugins"
echo "3. Use ':Lazy' to open the plugin manager UI"
