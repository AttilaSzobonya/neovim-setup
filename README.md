# Personal Neovim Configuration

This repository contains my personal Neovim configuration, built with modern tooling and best practices. The environment is set up using `lazy.nvim` which automatically installs and configures all necessary plugins with lazy loading for optimal performance.

## Installation & Setup

### 1. Install Neovim

**⚠️ Important:** This configuration requires Neovim version **0.10.0 or higher**.

Install Neovim using your system's package manager:

**Debian/Ubuntu:**
```bash
# Add the unstable repository for the latest version
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

**Alpine Linux:**
```bash
doas apk update && doas apk add neovim neovim-doc
```

**Fedora:**
```bash
sudo dnf update && sudo dnf install neovim
```

**Arch Linux:**
```bash
sudo pacman -S neovim
```

**macOS (Homebrew):**
```bash
brew install neovim
```

**Alternative: Build from Source (Linux/macOS):**
```bash
# For the latest features and fixes
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

**Verify Installation:**
```bash
nvim --version
# Should show version 0.10.0 or higher
```

If your version is below 0.10.0, please update before proceeding.

### 2. Clone the Configuration
Clone this repository to your Neovim configuration directory:

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# Clone the configuration
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/AttilaSzobonya/neovim-setup.git nvim
```

### 3. Set Environment Variable (Optional)
Configure your development environment by setting the `NEOVIM_ENVIRONMENT` variable:

```bash
# Add to your shell profile (~/.bashrc, ~/.zshrc, etc.)
export NEOVIM_ENVIRONMENT=php-dev    # For PHP development
export NEOVIM_ENVIRONMENT=rust-dev   # For Rust development
export NEOVIM_ENVIRONMENT=general-dev # For general development (same as unset)
# Or leave unset for general development configuration
```

### 4. First Launch
Open Neovim and let lazy.nvim install all plugins:

```bash
nvim
```

On first launch:
- Lazy.nvim will automatically install all plugins
- LSP servers will be configured based on your environment
- You may see some initial loading messages - this is normal

## Configuration Structure

```
~/.config/nvim/
├── init.lua                     # Main entry point and lazy.nvim bootstrap
├── lua/
│   ├── core/
│   │   ├── options.lua         # Core Neovim options and settings
│   │   └── keymaps.lua         # Key mappings and shortcuts
│   ├── plugins/
│   │   ├── colorscheme.lua     # Gruvbox theme configuration
│   │   ├── completion.lua      # nvim-cmp autocompletion setup
│   │   ├── env-specific.lua    # Environment-conditional plugins
│   │   ├── lsp.lua            # LSP configuration base
│   │   ├── nvim-tree.lua      # File explorer setup
│   │   ├── telescope.lua      # Fuzzy finder configuration
│   │   └── vim-visual-multi.lua # Multi-cursor support
│   └── env/
│       ├── general-dev.lua     # General development config
│       ├── php-dev.lua         # PHP, HTML, CSS, JS/TS development
│       └── rust-dev.lua        # Rust development with rust-analyzer
├── cleanup-packer.sh           # Script to remove old packer files
├── env-helper.sh              # Environment management utility
├── validate-config.sh         # Configuration validation script
└── README.md                  # This documentation
```

## Key Features

- **🚀 Lazy Loading**: Plugins load only when needed for lightning-fast startup
- **🔧 Environment-Specific**: Tailored configurations for different development workflows
- **📦 Modular Design**: Clean, maintainable structure with separated concerns
- **🧠 LSP Integration**: Full Language Server Protocol support with autocompletion
- **🎨 Modern UI**: Gruvbox theme with file explorer and fuzzy finder
- **⌨️ Smart Keybindings**: Intuitive shortcuts for common operations
- **🔄 Auto-Management**: Automatic plugin installation and updates

## Usage & Configuration

### Environment Configurations

The configuration supports different development environments through the `NEOVIM_ENVIRONMENT` variable:

| Environment | Purpose | Languages/Tools |
|-------------|---------|----------------|
| `php-dev` | Web Development | PHP, HTML, CSS, JavaScript, TypeScript |
| `rust-dev` | Systems Programming | Rust with rust-analyzer |
| `general-dev` | General Setup | Basic LSP support for common languages |
| *(unset/empty)* | Default | Same as `general-dev` |

**Note:** Unset, empty string, and `general-dev` are functionally equivalent and provide basic language server support.

**Setting Environment:**
```bash
# Option 1: Use the helper script
./env-helper.sh set php-dev

# Option 2: Export directly
export NEOVIM_ENVIRONMENT=rust-dev

# Option 3: Add to shell profile for persistence
echo 'export NEOVIM_ENVIRONMENT=php-dev' >> ~/.bashrc
```

### Key Mappings

**Leader Key: `,` (comma)**

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>e` | Toggle File Explorer | Open/close NvimTree |
| `<leader>f` | Find Files | Open Telescope file finder |
| `<leader>d` | Format Buffer | Format current file with LSP |

**LSP Navigation:**
| Shortcut | Action | Description |
|----------|--------|-------------|
| `gd` | Go to Definition | Jump to symbol definition |
| `gD` | Go to Declaration | Jump to symbol declaration |
| `gT` | Go to Type Definition | Jump to type definition |
| `gr` | Show References | List all references |
| `gi` | Go to Implementation | Jump to implementation |

**Custom Navigation:**
| Shortcut | Action | Description |
|----------|--------|-------------|
| `é` | End of Line | Jump to line end |
| `q` | Beginning of Line | Jump to line start |

**Completion (Insert Mode):**
| Shortcut | Action |
|----------|--------|
| `<Tab>` | Next completion item |
| `<S-Tab>` | Previous completion item |
| `<CR>` | Confirm selection |
| `<C-Space>` | Trigger completion |

### Plugin Management

Lazy.nvim provides powerful plugin management with automatic installation and updates:

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager UI |
| `:Lazy sync` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy profile` | Show startup performance |

**First-time setup:** Plugins install automatically on first launch - no manual intervention needed!

## Dependencies & Requirements

### Required
- **Neovim 0.8+** - Core editor
- **Git** - For plugin management and version control
- **curl/wget** - For downloading plugins

### Language Servers (Install as needed)

**PHP Development Environment:**
```bash
# PHP Language Server
composer global require phpactor/phpactor

# Node.js based servers (requires Node.js/npm)
npm install -g vscode-langservers-extracted  # HTML, CSS, JSON
npm install -g typescript-language-server    # TypeScript/JavaScript
npm install -g @vscode/vscode-eslint-language-server  # ESLint
```

**Rust Development Environment:**
```bash
# Rust toolchain (includes rust-analyzer)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer
```

### Optional Enhancements
- **A Nerd Font** - For proper icon display in file explorer
  - Download from [Nerd Fonts](https://www.nerdfonts.com/)
  - Recommended: FiraCode Nerd Font, JetBrains Mono Nerd Font
- **ripgrep** - Enhanced text searching with Telescope
- **fd** - Faster file finding with Telescope

## Included Utilities

The configuration includes several utility scripts for easier management:

### Environment Helper (`./env-helper.sh`)
Manage development environments easily:

```bash
./env-helper.sh show              # Check current environment
./env-helper.sh list              # List available environments
./env-helper.sh set php-dev       # Set PHP development environment
./env-helper.sh set rust-dev      # Set Rust development environment
./env-helper.sh unset             # Clear environment (minimal config)
```

### Configuration Validator (`./validate-config.sh`)
Verify your setup is correct:

```bash
./validate-config.sh             # Check configuration integrity
```

### Packer Cleanup (`./cleanup-packer.sh`)
Remove old packer.nvim files when migrating:

```bash
./cleanup-packer.sh              # Clean up old packer installation
```

## Troubleshooting

### Common Issues

**"Module not found" errors:**
- Ensure `NEOVIM_ENVIRONMENT` is set correctly (or leave unset for general-dev)
- Run `./env-helper.sh show` to verify current environment
- Invalid environments automatically fallback to general-dev configuration

**LSP not working:**
- Install required language servers (see Dependencies)
- Check `:LspInfo` for server status
- Restart Neovim after installing new language servers

**Plugins not loading:**
- Run `:Lazy sync` to update plugins
- Check `:Lazy` for any error messages
- Ensure internet connection for plugin downloads

**Slow startup:**
- Run `:Lazy profile` to identify slow plugins
- Most plugins are lazy-loaded by default

### Getting Help

1. Check `:checkhealth` for system diagnostics
2. Use `:Lazy` to inspect plugin status
3. Review error messages in `:messages`
4. Consult plugin documentation for specific issues

## License

This project is released into the public domain under [The Unlicense](LICENSE.md). You are free to use, modify, distribute, and do whatever you want with this code without any restrictions.
