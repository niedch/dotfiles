# Dotfiles

Personal configuration files for a productive development environment.

## Overview

This repository contains configuration files for various tools and applications, organized by application. The setup uses GNU Stow for symbolic link management, making it easy to install and uninstall configurations.

## Applications Configured

- **Ghostty** - Modern terminal emulator
- **Hyprland** - Dynamic tiling Wayland compositor
- **Neovim** - Lua-configured text editor with LazyVim
- **Tmux** - Terminal multiplexer
- **Zsh** - Shell with Oh My Zsh and custom configurations

## Installation

### Prerequisites

- GNU Stow must be installed on your system
- For specific applications, ensure they are installed before running the setup

### Quick Install

```bash
# Clone the repository
git clone <repository-url> ~/dotfiles
cd ~/dotfiles

# Run the installation script
./install.sh
```

### Manual Installation

```bash
# Install individual applications
stow -R ghostty -t $HOME
stow -R hypr -t $HOME
stow -R nvim -t $HOME
stow -R tmux -t $HOME
stow -R zsh -t $HOME
```

## Configuration Details

### Ghostty
- Location: `ghostty/.config/ghostty/`
- Modern terminal with integrated features
- Includes tmux integration scripts

### Hyprland
- Location: `hypr/.config/hypr/`
- Modular configuration split into:
  - `input.conf` - Input device settings
  - `looknfeel.conf` - Visual appearance
  - `monitors.conf` - Display configuration
  - `autostart.conf` - Startup applications
  - `bindings.conf` - Keybindings

### Neovim
- Location: `nvim/.config/nvim/`
- Based on LazyVim framework
- Extensive plugin configuration including:
  - LSP support with Mason
  - Git integration
  - Tree-sitter syntax highlighting
  - Debugging with DAP
  - Various language-specific tools

### Tmux
- Location: `tmux/.config/tmux/` and `tmux/.tmux.conf`
- Includes session management scripts
- Custom keybindings and status bar

### Zsh
- Location: `zsh/.zshrc` and `zsh/.config/zsh/`
- Oh My Zsh integration
- Environment management (NVM, SDKMAN, etc.)
- Custom aliases and functions
- Development tool configurations

## Uninstallation

```bash
# Run the uninstall script
./uninstall.sh

# Or manually unstow applications
stow -D ghostty hypr nvim tmux zsh
```

## Structure

```
dotfiles/
├── install.sh          # Main installation script
├── uninstall.sh        # Cleanup script
├── application.list     # List of applications to install
├── ghostty/            # Ghostty configuration
├── hypr/               # Hyprland configuration
├── nvim/               # Neovim configuration
├── tmux/               # Tmux configuration
└── zsh/                # Zsh configuration
```

## Customization

Each application directory contains its own configuration files. Modify them as needed, then run `stow -R <app> -t $HOME` to update the symlinks.

## Requirements

- GNU Stow
- Respective applications (Ghostty, Hyprland, Neovim, Tmux, Zsh)
- For Zsh: Oh My Zsh (optional but recommended)
