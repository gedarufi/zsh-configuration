# Zsh Configuration

Zsh (Z Shell) configuration with an advanced plugin ecosystem managed via Zinit. This setup provides a powerful, extensible shell environment with syntax highlighting, completions, auto-suggestions, and intelligent fuzzy finding.

## 📋 Overview

This Zsh configuration includes:

- **Zinit plugin manager** - Lightweight and fast plugin loader
- **Syntax highlighting** - Real-time shell command syntax coloring
- **Auto-suggestions** - Command history-based suggestions
- **Completions** - Advanced tab completion with fuzzy filtering
- **Fuzzy finding** - fzf-tab integration for enhanced searching
- **Productivity plugins** - Git, AWS, Kubernetes, Docker, and more

## 🔧 Components

### Core Configuration (`~/.zshrc`)

The main configuration file includes:

1. **Homebrew Setup** - macOS homebrew environment initialization
2. **Zinit Plugin Manager** - Auto-downloads and manages plugins
3. **Plugins**:
   - `zsh-syntax-highlighting` - Syntax coloring for commands
   - `zsh-completions` - Extended completion definitions
   - `zsh-autosuggestions` - Fish-like autosuggestions
   - `fzf-tab` - Fuzzy finder integration for tabs
4. **Snippets** - Oh-My-Zsh library snippets for common functionality
5. **Keybindings** - Custom key mappings for navigation
6. **History** - Advanced history settings

## 📦 Dependencies & Installation

### System Requirements

- **Zsh shell** (v5.7 or higher)
- **Git** - For plugin management
- **Homebrew** (macOS) or package manager (Linux)
- **Nerd Font** - For proper icon display (see [Fonts section](#-nerd-fonts))

### Install Zsh

**macOS:**
```bash
brew install zsh
chsh -s $(which zsh)
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install zsh
chsh -s $(which zsh)
```

**Fedora/CentOS:**
```bash
sudo dnf install zsh
chsh -s $(which zsh)
```

**Arch Linux:**
```bash
sudo pacman -S zsh
chsh -s $(which zsh)
```

### Install Git (if not already installed)

**macOS:**
```bash
brew install git
```

**Ubuntu/Debian:**
```bash
sudo apt-get install git
```

**Fedora/CentOS:**
```bash
sudo dnf install git
```

### 🎨 Nerd Fonts

Nerd fonts are required for proper display of icons and symbols.

#### Option 1: Install with Homebrew (macOS & Linux)

```bash
# For macOS
brew install --cask font-geist-mono-nerd-font

# Or using brew tap
brew tap homebrew/cask-fonts
brew install --cask font-geist-mono-nerd-font
```

#### Option 2: Manual Installation

1. Download your preferred Nerd Font from https://www.nerdfonts.com/
2. Extract the font files
3. **macOS**: Copy to `~/Library/Fonts/`
4. **Linux**: Copy to `~/.local/share/fonts/`
5. Run `fc-cache -fv` on Linux to rebuild font cache

#### Recommended Nerd Fonts

- **GeistMono Nerd Font** (used in this config) - Clean, modern
- **JetBrains Mono Nerd Font** - Developer-friendly
- **Fira Code Nerd Font** - Great ligature support
- **Ubuntu Mono Nerd Font** - System consistency

### 🔗 Additional Tools (Optional but Recommended)

For full functionality of all plugins and features:

```bash
# macOS
brew install fzf ripgrep bat exa

# Ubuntu/Debian
sudo apt-get install fzf ripgrep bat exa

# Fedora/CentOS
sudo dnf install fzf ripgrep bat exa

# Arch Linux
sudo pacman -S fzf ripgrep bat exa
```

- **fzf** - Fuzzy finder for command line
- **ripgrep** - Fast file searcher
- **bat** - Better cat with syntax highlighting
- **exa** - Modern ls replacement

## 📥 Installation

### 1. Clone or Copy Configuration

```bash
# Clone the repository
git clone https://github.com/gedarufi/zsh-configuration.git
cd zsh-configuration

# Copy .zshrc to home directory
cp zsh/.zshrc ~/.zshrc
```

### 2. Reload Zsh

```bash
# Reload configuration without restarting
source ~/.zshrc

# Or restart terminal
```

Zinit will automatically download and install all plugins on first run.

### 3. Configure Your Nerd Font

Add the following to your terminal emulator settings:

- **Font Family**: GeistMono Nerd Font Mono (or your chosen Nerd Font)
- **Font Size**: 12-14pt (adjust to preference)
- **Line Height**: 1.2-1.4

## ⌨️ Keybindings

Custom keybindings for productivity:

| Keybinding | Action |
|-----------|--------|
| `Ctrl+P` | Search history backward |
| `Ctrl+N` | Search history forward |
| `Alt+W` | Kill/delete word/region |
| `Tab` | Fuzzy completion with fzf |

## 🎯 Common Aliases & Features

Available through Oh-My-Zsh snippets:

- **Git**: `ga`, `gc`, `gp`, `gl`, etc. (full Oh-My-Zsh git aliases)
- **Sudo**: Easy `sudo` command re-execution
- **Kubernetes**: `kubectl` aliases and completions
- **AWS**: AWS CLI completions
- **Docker**: Docker command completions

## 🔧 Customization

### Add Custom Aliases

Edit `~/.zshrc` and add before the `zinit cdreplay` line:

```bash
# Custom aliases
alias ll='ls -la'
alias grep='grep --color=auto'
alias docker-clean='docker system prune -a'
```

### Add New Plugins

```bash
# Add a new plugin to ~/.zshrc
zinit light <user>/<plugin-name>
```

### Disable Plugins

Simply comment out or remove the `zinit light` line for the plugin you want to disable.

## 🐛 Troubleshooting

### Plugins not loading

```bash
# Reinstall plugins
rm -rf ~/.local/share/zinit
source ~/.zshrc
```

### Icons not displaying properly

- Ensure you have installed a Nerd Font
- Check terminal emulator font settings
- Try a different Nerd Font if issues persist

### Command not found errors

```bash
# Rebuild completions
rm -f ~/.zcompdump
exec zsh
```

### Slow startup time

Check which plugins are slowing down loading:

```bash
time zsh -i -c exit
```

Consider disabling heavy plugins or using Zinit's turbo mode for non-essential plugins.

## 📚 Resources

- [Zsh Homepage](https://www.zsh.org/)
- [Zinit Repository](https://github.com/zdharma-continuum/zinit)
- [Oh-My-Zsh Plugins](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [Zsh Plugins & Themes](https://awesome-cli.com/)

## ℹ️ Notes

- Configuration includes Homebrew initialization for macOS compatibility
- Linux users can safely ignore macOS-specific sections
- Regular updates to plugins are recommended for security and features
- This setup supports WSL (Windows Subsystem for Linux) out of the box
