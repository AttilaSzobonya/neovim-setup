# Neovim Configuration with lazy.nvim

This Neovim configuration has been migrated from packer.nvim to lazy.nvim for better performance and easier plugin management.

## Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point and lazy.nvim bootstrap
├── lua/
│   ├── core/
│   │   ├── options.lua        # Core Neovim options
│   │   └── keymaps.lua        # Key mappings
│   ├── plugins/
│   │   ├── colorscheme.lua    # Gruvbox theme
│   │   ├── completion.lua     # nvim-cmp autocompletion
│   │   ├── env-specific.lua   # Environment-specific plugins
│   │   ├── lsp.lua           # LSP configuration
│   │   ├── nvim-tree.lua     # File explorer
│   │   ├── telescope.lua     # Fuzzy finder
│   │   └── vim-visual-multi.lua # Multi-cursor support
│   └── env/
│       ├── general-dev.lua    # General development config
│       ├── php-dev.lua        # PHP development config
│       └── rust-dev.lua       # Rust development config
```

## Key Features

- **Lazy Loading**: Plugins are loaded only when needed for better startup performance
- **Environment-specific configuration**: Different setups for PHP, Rust, or general development
- **Modular structure**: Easy to maintain and extend
- **LSP Support**: Language server protocol support for various languages

## Usage

### Environment Variables

Set the `NEOVIM_ENVIRONMENT` environment variable to load specific configurations:

```bash
export NEOVIM_ENVIRONMENT=php-dev    # For PHP development
export NEOVIM_ENVIRONMENT=rust-dev   # For Rust development
export NEOVIM_ENVIRONMENT=general-dev # For general development
```

### Key Mappings

- `<leader>e` - Toggle NvimTree file explorer
- `<leader>f` - Open Telescope find files
- `<leader>d` - Format current buffer
- `gd` - Go to definition
- `gD` - Go to declaration
- `gT` - Go to type definition
- `gr` - Show references
- `gi` - Go to implementation
- `é` - Go to end of line
- `q` - Go to beginning of line

### Plugin Management

Lazy.nvim will automatically install missing plugins on first startup. You can also manually manage plugins with:

- `:Lazy` - Open lazy.nvim UI
- `:Lazy sync` - Update all plugins
- `:Lazy clean` - Remove unused plugins

## Migration from Packer

The configuration has been successfully migrated from packer.nvim to lazy.nvim with the following improvements:

1. **Better performance**: Lazy loading reduces startup time
2. **Improved error handling**: Better plugin loading diagnostics
3. **Cleaner configuration**: Modular plugin structure
4. **Enhanced features**: Built-in profiling and dependency management

## Dependencies

Make sure you have the following external dependencies installed for full functionality:

### PHP Development
- `phpactor` - PHP language server
- `vscode-html-language-server` - HTML language server
- `vscode-css-language-server` - CSS language server
- `typescript-language-server` - TypeScript/JavaScript language server
- `vscode-eslint-language-server` - ESLint language server

### Rust Development
- `rust-analyzer` - Rust language server (usually installed with rustup)

### General
- `git` - For version control and plugin management
- A Nerd Font for proper icon display (optional)
