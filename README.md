# Dotfiles

My personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's Inside

- **ghostty** - Terminal emulator configuration
- **hypr** - Hyprland (Wayland compositor) config
- **mux-session** - Session management for tmux/terminal
- **nvim** - Neovim configuration
- **tmux** - Terminal multiplexer config
- **zsh** - Zsh shell configuration

## Installation

1. Install GNU Stow:
   ```bash
   # Arch
   sudo pacman -S stow
   # Debian/Ubuntu
   sudo apt install stow
   # macOS
   brew install stow
   ```

2. Clone this repo to `~/.dotfiles`:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   ```

3. Run the install script:
   ```bash
   cd ~/.dotfiles
   ./install.sh
   ```

The install script stows each directory to `$HOME/.config/`.

## Usage

- **Update**: Re-run `./install.sh` to symlink any changes
- **Uninstall**: Run `./uninstall.sh` to remove symlinks
