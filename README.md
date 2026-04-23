# zsh-configuration

A comprehensive terminal and shell configuration repository for a modern development environment on macOS and Linux. This repository includes configurations for Zsh, Ghostty, Oh My Posh, and Tmux.

> **A complete terminal setup** that combines a powerful shell (Zsh), beautiful terminal emulator (Ghostty), stunning prompt (Oh My Posh), and powerful multiplexer (Tmux) for an integrated, productive development experience.

## 📋 Overview

This repository provides a complete, integrated terminal setup featuring:

- **Zsh** - Advanced shell with plugins via Zinit (syntax highlighting, completions, auto-suggestions, fzf-tab)
- **Ghostty** - A modern terminal emulator with Tokyo Night theme
- **Oh My Posh** - Custom prompt theme for a visually rich shell experience
- **Tmux** - Terminal multiplexer for session management and productivity

Each component is configured to work seamlessly together, creating a polished and productive development environment.

## 📑 Table of Contents

- [Prerequisites](#-prerequisites)
- [Repository Structure](#-repository-structure)
- [Quick Start](#-quick-start)
- [Components](#%EF%B8%8F-components)
- [Installation Guide](#-installation-guide)
- [System Requirements](#-system-requirements)
- [Customization](#-customization)
- [Quick Reference](#-quick-reference)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [Resources](#-resources)
- [License](#-license)

## 🎯 Prerequisites

### System Requirements

**Supported Operating Systems:**
- macOS 10.15+ (Intel or Apple Silicon)
- Linux (Ubuntu 18.04+, Fedora 30+, Arch, Debian)
- WSL (Windows Subsystem for Linux)

**Required Tools:**
- **Git** - For version control and plugin management
- **Homebrew** (macOS) - Package management (`brew.sh`)
- **System Package Manager** (Linux) - `apt`, `dnf`, `pacman`, etc.
- **Nerd Font** - For terminal icons and symbols (GeistMono recommended)

**Recommended Tools:**
- **curl/wget** - For downloading packages
- **fzf** - Fuzzy finder for command line
- **ripgrep** - Fast file searcher
- **bat** - Better cat with syntax highlighting

### Quick Version Check

```bash
# Check if you have the basics installed
zsh --version
git --version
brew --version  # macOS only
```

## 🗂️ Repository Structure

```
zsh-configuration/
├── README.md                           # Main documentation (this file)
│
├── zsh/
│   ├── README.md                       # Zsh setup guide
│   └── .zshrc                          # Main Zsh configuration
│
├── ghostty/
│   ├── README.md                       # Ghostty setup guide
│   └── config                          # Ghostty terminal configuration
│
├── oh-my-posh/
│   ├── README.md                       # Oh My Posh setup guide
│   └── gedarufi.toml                   # Custom prompt theme (Tokyo Night)
│
├── tmux/
│   ├── README.md                       # Tmux setup guide
│   ├── tmux.conf                       # Main Tmux configuration with plugins
│   └── tmux.reset.conf                 # Reset/default keybindings
│
└── .config/                            # Other configuration files
    └── (User configs that reference this setup)
```

**Component Details:**
- Each component has its own `README.md` with detailed setup instructions
- All configurations are optional and can be used independently
- Each tool is pre-configured but fully customizable

## 🚀 Quick Start

### For the Impatient

```bash
# 1. Clone the repo
git clone https://github.com/gedarufi/zsh-configuration.git
cd zsh-configuration

# 2. Install dependencies (macOS example)
brew install zsh git ghostty oh-my-posh tmux fzf

# 3. Install Nerd Font
brew install --cask font-geist-mono-nerd-font

# 4. Copy configurations to your home directory
mkdir -p ~/.config/{zsh,ghostty,oh-my-posh,tmux}
cp zsh/.zshrc ~/.zshrc
cp ghostty/config ~/.config/ghostty/config
cp oh-my-posh/gedarufi.toml ~/.config/oh-my-posh/gedarufi.toml
cp tmux/tmux.conf ~/.config/tmux/tmux.conf
cp tmux/tmux.reset.conf ~/.config/tmux/tmux.reset.conf

# 5. Switch to Zsh
chsh -s $(which zsh)

# 6. Reload your shell
exec zsh

# 7. Set up Tmux plugins (inside Tmux)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Then in Tmux: Ctrl+A, I
```

## 📥 Installation Guide

### Step 1: Install Core Dependencies

**macOS:**
```bash
# Install Homebrew if needed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install core tools
brew install zsh git ghostty oh-my-posh tmux fzf ripgrep bat
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install zsh git tmux fzf ripgrep bat -y

# Install Ghostty: https://ghostty.org/docs/install/linux
# Install Oh My Posh: curl -s https://ohmyposh.dev/install/linux.sh | bash -s
```

**Fedora/CentOS:**
```bash
sudo dnf install zsh git tmux fzf ripgrep bat -y
# Then install Ghostty and Oh My Posh from their respective sources
```

### Step 2: Install Nerd Font

**macOS:**
```bash
brew install --cask font-geist-mono-nerd-font
```

**Linux:**
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/GeistMono.zip
unzip GeistMono.zip && rm GeistMono.zip
fc-cache -fv
```

### Step 3: Copy Configuration Files

```bash
# Create config directories
mkdir -p ~/.config/{zsh,ghostty,oh-my-posh,tmux}

# Copy configuration files
cp zsh/.zshrc ~/.zshrc
cp ghostty/config ~/.config/ghostty/config
cp oh-my-posh/gedarufi.toml ~/.config/oh-my-posh/gedarufi.toml
cp tmux/tmux.conf ~/.config/tmux/tmux.conf
cp tmux/tmux.reset.conf ~/.config/tmux/tmux.reset.conf
```

### Step 4: Configure Terminal Emulator

1. **Open Ghostty** (or your current terminal)
2. **Set the font** to "GeistMono Nerd Font Mono"
3. **Verify** icons display correctly

### Step 5: Switch Shell to Zsh

```bash
# Change default shell to Zsh
chsh -s $(which zsh)

# Verify
echo $SHELL  # Should output: /usr/bin/zsh or /usr/local/bin/zsh
```

### Step 6: Reload Configuration

```bash
# Reload Zsh
exec zsh
# or
source ~/.zshrc
```

### Step 7: Set Up Tmux Plugins (Optional)

```bash
# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start a new Tmux session
tmux new-session -s main

# Inside Tmux, install plugins: Ctrl+A, I
```

## 🖥️ System Requirements

### Minimum Requirements

| Component | Requirement | Version |
|-----------|-------------|---------|
| **OS** | macOS or Linux | 10.15+ / Ubuntu 18.04+ |
| **Zsh** | Z Shell | 5.7+ |
| **Git** | Version Control | 2.20+ |
| **Terminal** | Any ANSI Terminal | Modern |

### Recommended Setup

| Component | Recommended | Package Manager |
|-----------|-------------|-----------------|
| **Zsh** | Latest | brew/apt/dnf/pacman |
| **Ghostty** | Latest | brew/release |
| **Oh My Posh** | Latest | brew/curl |
| **Tmux** | v3.1+ | brew/apt/dnf/pacman |
| **Nerd Font** | GeistMono | brew/fonts.com |
| **fzf** | Latest | brew/apt/dnf/pacman |

### Optional Enhancements

- **ripgrep** - Fast file searching (better than grep)
- **bat** - Syntax highlighting for cat
- **exa** - Modern ls replacement
- **fd** - User-friendly find alternative
- **btop** - Better system monitor

## ⚙️ Components

### 🔤 Zsh

Advanced Z shell with a rich plugin ecosystem managed via Zinit.

**Key Features:**
- ✅ Syntax highlighting and auto-suggestions
- ✅ Command completion and fuzzy finding
- ✅ AWS, Kubernetes, and Git plugin support
- ✅ Fast plugin loading with Zinit
- ✅ Customizable keybindings

**Quick Links:**
- 📖 [Full Setup Guide](./zsh/README.md)
- 🔧 Configuration: `zsh/.zshrc`
- 📚 Plugins: zsh-syntax-highlighting, zsh-completions, zsh-autosuggestions, fzf-tab

---

### 🖥️ Ghostty

Modern terminal emulator with beautiful aesthetics and powerful features.

**Key Features:**
- ✅ Custom fonts and themes (Tokyo Night)
- ✅ Shell integration for better CLI experience
- ✅ High visual fidelity with blur effects
- ✅ Cross-platform (macOS, Linux, Windows)
- ✅ GPU-accelerated rendering

**Quick Links:**
- 📖 [Full Setup Guide](./ghostty/README.md)
- 🔧 Configuration: `ghostty/config`
- 🎨 Theme: Tokyo Night Storm

---

### 🎨 Oh My Posh

Beautiful, customizable prompt engine with real-time information display.

**Key Features:**
- ✅ Git status integration
- ✅ Command execution status indicators
- ✅ System and OS information display
- ✅ Custom Tokyo Night color palette
- ✅ Multi-shell support (Zsh, Bash, PowerShell)

**Quick Links:**
- 📖 [Full Setup Guide](./oh-my-posh/README.md)
- 🔧 Configuration: `oh-my-posh/gedarufi.toml`
- 🎨 Segments: OS, Git, Path, Status, Battery, Language versions

---

### 📦 Tmux

Terminal multiplexer for managing multiple sessions and windows.

**Key Features:**
- ✅ Session management and persistence
- ✅ FZF integration for fuzzy finding
- ✅ URL highlighting and extraction
- ✅ Automatic session resurrection
- ✅ Beautiful Catppuccin theme
- ✅ 10+ curated plugins

**Quick Links:**
- 📖 [Full Setup Guide](./tmux/README.md)
- 🔧 Configuration: `tmux/tmux.conf`
- 🔌 Plugins: TPM, Sensible, Yank, Resurrect, FZF, and more

## 🔧 Customization

Each component can be customized independently:

### Zsh Configuration
Edit `~/.zshrc` to:
- Add custom aliases
- Install new plugins via Zinit
- Modify keybindings
- Add shell functions

### Ghostty Configuration
Edit `~/.config/ghostty/config` to:
- Change font and size
- Switch themes
- Adjust blur effects
- Configure shell integration

### Oh My Posh Configuration
Edit `~/.config/oh-my-posh/gedarufi.toml` to:
- Customize prompt colors
- Add/remove segments
- Adjust spacing and symbols
- Create new themes

### Tmux Configuration
Edit `~/.config/tmux/tmux.conf` to:
- Change prefix key
- Add/remove plugins
- Modify keybindings
- Adjust appearance

## 📖 Detailed Documentation

For comprehensive setup instructions, customization options, and troubleshooting, see individual component guides:

| Component | Documentation | Setup Time |
|-----------|---------------|-----------|
| **Zsh** | [zsh/README.md](./zsh/README.md) | 10-15 min |
| **Ghostty** | [ghostty/README.md](./ghostty/README.md) | 5-10 min |
| **Oh My Posh** | [oh-my-posh/README.md](./oh-my-posh/README.md) | 5-10 min |
| **Tmux** | [tmux/README.md](./tmux/README.md) | 15-20 min |

## 🎯 Quick Reference

### Common Commands

**Zsh:**
```bash
# Reload configuration
exec zsh

# Update Zinit plugins
zinit update
```

**Ghostty:**
```bash
# Open configuration
nano ~/.config/ghostty/config

# Restart to apply changes
```

**Oh My Posh:**
```bash
# Test configuration
oh-my-posh init zsh --config ~/.config/oh-my-posh/gedarufi.toml

# View available themes
oh-my-posh theme list
```

**Tmux:**
```bash
# Create new session
tmux new-session -s project-name

# List all sessions
tmux list-sessions

# Attach to session
tmux attach -t project-name

# Install plugins (inside Tmux)
# Ctrl+A, I
```

### Keyboard Shortcuts

**Ghostty:**
- `Cmd+Plus/Minus` (macOS) or `Ctrl+Plus/Minus` (Linux) - Zoom font

**Tmux (with Ctrl+A prefix):**
- `Ctrl+A, C` - Create new window
- `Ctrl+A, N` - Next window
- `Ctrl+A, P` - Previous window
- `Ctrl+A, %` - Split pane vertically
- `Ctrl+A, "` - Split pane horizontally
- `Ctrl+A, I` - Install plugins

**Zsh:**
- `Ctrl+P` - Search history backward
- `Ctrl+N` - Search history forward
- `Tab` - Fuzzy completion

## 🐛 Troubleshooting

### Common Issues

**Icons or colors not displaying:**
- Verify Nerd Font is installed
- Check terminal font settings
- Reload shell configuration

**Plugins not loading:**
- Restart terminal
- Check plugin manager status
- Review configuration syntax

**Performance issues:**
- Disable unused plugins
- Clear plugin cache
- Check for large repository operations

For more detailed troubleshooting, see individual component READMEs.

## 🤝 Contributing

Found an issue or have an improvement?
1. Test your changes thoroughly
2. Document any modifications
3. Keep configurations compatible across platforms
4. Maintain the Tokyo Night color scheme consistency

## 📚 Resources

### Official Documentation
- [Zsh Manual](https://www.zsh.org/)
- [Ghostty Docs](https://ghostty.org/docs)
- [Oh My Posh Docs](https://ohmyposh.dev/docs)
- [Tmux Manual](https://man7.org/linux/man-pages/man1/tmux.1.html)

### Useful Tools
- [Zinit Plugin Manager](https://github.com/zdharma-continuum/zinit)
- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [Tokyo Night Theme](https://github.com/enkia/tokyo-night-vscode-theme)

### Learning Resources
- [Zsh Plugins Guide](https://awesome-cli.com/)
- [FZF Tutorial](https://github.com/junegunn/fzf)
- [Tmux Guide](https://github.com/tmux/tmux/wiki)

## ℹ️ Notes

- ✅ This setup is designed for personal use and can be adapted to your workflow
- ℹ️ Some configurations are macOS-specific (e.g., Homebrew paths)
- 🐧 Linux users may need to adjust package manager commands and paths accordingly

## 📝 Credits

- 🎨 **Theme**: Inspired by [Tokyo Night](https://github.com/enkia/tokyo-night-vscode-theme) color scheme
- 📦 **Tmux Config**: Based on [omerxx/dotfiles](https://github.com/omerxx/dotfiles/tree/master/tmux)
- 🔧 **Tools**: Built on Zsh, Ghostty, Oh My Posh, and Tmux

## 📄 License

Feel free to reuse or adapt this configuration for your own shell setup.

**License**: MIT

---

<div align="center">

### ⭐ If you find this helpful, please consider starring the repository!

Made with ❤️ for terminal enthusiasts and developers

</div>