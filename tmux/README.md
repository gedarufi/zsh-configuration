# Tmux Configuration

[Tmux](https://github.com/tmux/tmux/wiki) - A terminal multiplexer for managing multiple terminal sessions and windows. This configuration provides a modern, plugin-rich setup with productivity enhancements, URL handling, session management, and a beautiful UI.

## 📋 Overview

Tmux enables:

- **Session Management** - Create and manage multiple independent terminal sessions
- **Window & Pane Management** - Split and organize workspaces within sessions
- **Terminal Multiplexing** - Run multiple programs in parallel without context switching
- **Productivity Features** - FZF integration, URL handling, copy/paste enhancements
- **Plugin Ecosystem** - Extend functionality with community-maintained plugins
- **Beautiful UI** - Catppuccin theme with informative status bar

This configuration includes:
- 10+ curated plugins for enhanced functionality
- FZF integration for command and URL handling
- Tmux Resurrect for session persistence
- Catppuccin theme for visual consistency
- Mouse support for intuitive interactions

## 📦 Dependencies & Installation

### System Requirements

- **Tmux** (v3.1 or higher)
- **Git** - For plugin management
- **fzf** - Fuzzy finder (optional but recommended)
- **Homebrew** (macOS) or system package manager (Linux)

### Install Tmux

#### macOS

**Homebrew (Recommended):**

```bash
brew install tmux
```

**From source:**

```bash
git clone https://github.com/tmux/tmux.git
cd tmux
./configure
make
make install
```

#### Linux

**Ubuntu/Debian:**

```bash
sudo apt-get update
sudo apt-get install tmux
```

**Fedora/CentOS:**

```bash
sudo dnf install tmux
```

**Arch Linux:**

```bash
sudo pacman -S tmux
```

### Install FZF (Optional but Recommended)

FZF enables powerful fuzzy finding for commands and URLs within Tmux.

**macOS:**

```bash
brew install fzf
```

**Linux:**

```bash
# Ubuntu/Debian
sudo apt-get install fzf

# Fedora/CentOS
sudo dnf install fzf

# Arch Linux
sudo pacman -S fzf
```

### Additional Tools (Optional)

For enhanced functionality with all plugins:

```bash
# macOS
brew install ripgrep bat

# Linux - Ubuntu/Debian
sudo apt-get install ripgrep bat

# Linux - Fedora/CentOS
sudo dnf install ripgrep bat

# Linux - Arch
sudo pacman -S ripgrep bat
```

## 🔧 Configuration Files

Two main configuration files:

1. **tmux.conf** - Main configuration with settings and plugins
2. **tmux.reset.conf** - Clean slate configuration (sourced by main config)

### Configuration Highlights

Key settings in this configuration:

```bash
# Prefix key (default is Ctrl+B, changed to Ctrl+A)
set -g prefix ^A

# 256 color support with RGB
set-option -g default-terminal 'screen-256color'
set-option -g terminal-overrides ',xterm-256color:RGB'

# Mouse support enabled
set -g mouse on

# Window indexing starts at 1 (more intuitive)
set -g base-index 1

# Vi keybindings in copy mode
setw -g mode-keys vi

# Catppuccin theme
set -g @plugin 'omerxx/catppuccin-tmux'
```

## 📦 Included Plugins

This configuration uses **Tmux Plugin Manager (TPM)** to manage 9+ plugins:

| Plugin | Purpose |
|--------|---------|
| **tpm** | Plugin manager for Tmux |
| **tmux-sensible** | Common tmux settings |
| **tmux-yank** | Enhanced copy/paste to system clipboard |
| **tmux-resurrect** | Persist and restore Tmux sessions |
| **tmux-continuum** | Automatic session resurrection |
| **tmux-thumbs** | Quick link highlighting and selection |
| **tmux-fzf** | Fuzzy finder integration for Tmux |
| **tmux-fzf-url** | URL extraction and fuzzy selection |
| **catppuccin-tmux** | Beautiful Catppuccin theme |
| **tmux-sessionx** | Enhanced session management |
| **tmux-floax** | Floating windows support |

### Plugin Descriptions

**TPM (Tmux Plugin Manager)**
- Core plugin system for Tmux
- Manages plugin installation and loading

**Sensible**
- Reasonable defaults for Tmux
- Improves usability out of the box

**Yank**
- Seamless copy/paste with system clipboard
- Works across SSH and local terminals

**Resurrect & Continuum**
- Saves and restores session state
- Automatic backup of open windows and panes

**Thumbs**
- Highlight URLs and other searchable text
- Jump to selections with keyboard shortcuts

**FZF Integration**
- Fuzzy search for panes, windows, and commands
- FZF URL - Extract and open URLs with preview

**Catppuccin Theme**
- Beautiful, cohesive color scheme
- Matches other terminal applications

**SessionX**
- Advanced session navigation and creation
- Zoxide integration for smart directory jumps

**Floax**
- Floating window support
- Useful for temporary tasks or notes

## 📥 Installation Steps

### 1. Install Tmux and Dependencies

```bash
# macOS
brew install tmux fzf

# Ubuntu/Debian
sudo apt-get update
sudo apt-get install tmux fzf

# Fedora/CentOS
sudo dnf install tmux fzf

# Arch Linux
sudo pacman -S tmux fzf
```

### 2. Create Tmux Configuration Directory

```bash
mkdir -p ~/.config/tmux
```

### 3. Copy Configuration Files

```bash
# Copy main configuration
cp tmux/tmux.conf ~/.config/tmux/tmux.conf

# Copy reset configuration (if present)
cp tmux/tmux.reset.conf ~/.config/tmux/tmux.reset.conf
```

### 4. Install TPM (Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 5. Create and Test Tmux Session

```bash
# Start new Tmux session
tmux new-session -s main

# Inside Tmux, press Ctrl+A (prefix key) then I (capital i)
# This installs all plugins defined in tmux.conf
```

### 6. Plugin Installation Shortcut

Inside a Tmux session:

```
Ctrl+A, I
```

This command triggers TPM to:
- Fetch all plugins from GitHub
- Clone them to `~/.tmux/plugins/`
- Source plugin configurations

Wait for completion (should see success messages).

### 7. Verify Installation

Check that plugins are installed:

```bash
ls ~/.tmux/plugins/
```

You should see directories for each plugin.

## ⌨️ Key Bindings

### Default Tmux Bindings (Customized)

| Binding | Action |
|---------|--------|
| `Ctrl+A` | Prefix key (instead of Ctrl+B) |
| `Ctrl+A, C` | Create new window |
| `Ctrl+A, N` | Next window |
| `Ctrl+A, P` | Previous window |
| `Ctrl+A, L` | Last window |
| `Ctrl+A, %` | Split pane vertically |
| `Ctrl+A, "` | Split pane horizontally |
| `Ctrl+A, O` | Switch to next pane |
| `Ctrl+A, D` | Detach from session |
| `Ctrl+A, ]` | Enter copy mode |

### Plugin-Specific Bindings

**SessionX:**
- `Ctrl+A, O` - Open session finder

**Floax:**
- `Ctrl+A, P` - Toggle floating window

**Tmux-Thumbs:**
- `Ctrl+A, T` - Highlight and select links

**FZF Keybindings:**
- `Ctrl+A, /` - Search windows
- `Ctrl+A, ?` - Search panes

## 🎯 Common Tasks

### Create New Session

```bash
tmux new-session -s project-name
# Or shorthand
tmux new -s project-name
```

### List Open Sessions

```bash
tmux list-sessions
# Or from within tmux
Ctrl+A, S
```

### Attach to Existing Session

```bash
tmux attach-session -t session-name
# Or shorthand
tmux attach -t session-name
```

### Detach from Session (Keep Running)

```bash
Ctrl+A, D
```

### Kill a Session

```bash
tmux kill-session -t session-name
```

### Create Named Window

```bash
Ctrl+A, C     # Create window
Ctrl+A, ,     # Rename window
```

### Split Panes

```bash
Ctrl+A, %     # Split vertically
Ctrl+A, "     # Split horizontally
Ctrl+A, O     # Switch to next pane
```

### Copy/Paste

```bash
Ctrl+A, [     # Enter copy mode
# Navigate with vi keys
# Space to start selection
# Enter to copy
Ctrl+A, ]     # Paste
```

### Save Session State

Sessions are automatically saved with Tmux Resurrect (continuum enabled).

To manually save:
```bash
# Resurect saves automatically every 15 minutes
# Force save with: Ctrl+A, Ctrl+S
```

To restore after restart:
```bash
# Automatic with Tmux Continuum
# Or manually: Ctrl+A, Ctrl+R
```

## ⚙️ Customization

### Change Prefix Key

Edit `~/.config/tmux/tmux.conf`:

```bash
set -g prefix C-Space    # Use Ctrl+Space instead of Ctrl+A
```

### Change Theme

Replace the Catppuccin plugin with another theme:

```bash
set -g @plugin 'dracula/tmux'
# or
set -g @plugin 'seebi/tmux-colors-solarized'
```

### Disable Plugins

Comment out plugins you don't need:

```bash
# set -g @plugin 'fcsonline/tmux-thumbs'
# set -g @plugin 'sainnhe/tmux-fzf'
```

Then reload: `Ctrl+A, R` or restart Tmux.

### Enable/Disable Mouse

```bash
# Enable mouse
set -g mouse on

# Disable mouse
set -g mouse off
```

### Adjust Status Bar

```bash
# Status bar at top (macOS style)
set -g status-position top

# Or at bottom
set -g status-position bottom
```

### Customize Pane Borders

```bash
set -g pane-active-border-style 'fg=magenta,bg=default'
set -g pane-border-style 'fg=brightblack,bg=default'
```

## 🔧 Configuration Tweaks

### Increase History Size

```bash
# Default is 2000 lines, this config has 1,000,000
set -g history-limit 1000000
```

### Disable Session Detach on Close

```bash
# Prevents automatic exit when closing a pane
set -g detach-on-destroy off
```

### Zero-Out Escape Time

```bash
# Removes delay after pressing prefix key
set -g escape-time 0
```

### Enable Vi Mode in Copy

```bash
# Use vi keybindings instead of emacs
setw -g mode-keys vi
```

## 🐛 Troubleshooting

### Plugins not installing

```bash
# Verify TPM is installed
ls ~/.tmux/plugins/tpm/

# In Tmux, try installing again
Ctrl+A, I

# Check for errors in ~/.tmux/plugins/tpm/tpm file
```

### Tmux not starting with configuration

```bash
# Test configuration syntax
tmux source-file ~/.config/tmux/tmux.conf

# Check for errors in the config
```

### Colors not displaying correctly

```bash
# Verify terminal supports 256 colors
echo $TERM

# In Tmux
Ctrl+A, :
# Type: display-message "#{client_termname}"

# Should show 'screen-256color' or similar
```

### FZF not working

```bash
# Verify FZF is installed
which fzf

# Install FZF if missing
brew install fzf  # macOS
# or
sudo apt-get install fzf  # Linux
```

### Session resurrection not working

Check this setting is enabled:

```bash
set -g @continuum-restore 'on'
```

Manually restore with: `Ctrl+A, Ctrl+R`

### High CPU usage by TPM

TPM can be resource-intensive with many plugins. Try:

```bash
# Reduce plugin count
# Or disable automatic restoration
set -g @continuum-save-interval '0'
```

## 📚 Resources

- [Tmux Manual](https://man7.org/linux/man-pages/man1/tmux.1.html)
- [Tmux GitHub](https://github.com/tmux/tmux/wiki)
- [TPM (Plugin Manager)](https://github.com/tmux-plugins/tpm)
- [Tmux Plugins](https://github.com/tmux-plugins)
- [Catppuccin Theme](https://github.com/catppuccin/tmux)
- [FZF Documentation](https://github.com/junegunn/fzf)

## 🎯 Tips & Tricks

1. **Use Sessions**: Organize work by project (e.g., `tmux new -s frontend`, `tmux new -s backend`)
2. **Named Windows**: Use descriptive window names (`Ctrl+A, ,`)
3. **Pane Layout**: Learn layout shortcuts for faster navigation
4. **Buffer Management**: Copy multiple items with yank plugin
5. **Session Sharing**: Share sessions with colleagues over SSH
6. **Floating Windows**: Use Floax for quick temporary tasks
7. **Automation**: Create scripts to open common session layouts

## 🔗 Original Configuration Source

This configuration is based on:
https://github.com/omerxx/dotfiles/tree/master/tmux

## ℹ️ Notes

- This configuration requires TPM to be installed first
- All plugins are managed centrally in `tmux.conf`
- Plugin updates can be pulled regularly from GitHub
- Session restoration is automatic with Continuum enabled
- Configuration is optimized for productivity and aesthetics
- Compatible with Docker, SSH, and local development alike