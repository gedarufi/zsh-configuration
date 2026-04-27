# Oh My Posh Configuration

[Oh My Posh](https://ohmyposh.dev/) - A powerful and flexible prompt engine for any shell. This configuration features a custom "Gedarufi" theme with beautiful colors from the Tokyo Night palette, showing system information, git status, and command execution results.

## 📋 Overview

Oh My Posh provides:

- **Beautiful Prompts** - Highly customizable command-line prompts
- **Multi-Shell Support** - Works with Zsh, Bash, PowerShell, and more
- **Real-time Information** - Git status, command results, system data
- **Theme Engine** - Extensive theme library or create custom themes
- **Performance Optimized** - Fast, non-blocking prompt rendering
- **Cross-Platform** - macOS, Linux, Windows compatibility

This custom configuration (`gedarufi.toml`) provides:
- **Tokyo Night color palette** - Complete color scheme from Tokyo Night Storm theme
- **OS and system information** - Displays operating system icon with WSL detection
- **User session display** - Shows current user with distinctive highlighting
- **Path display** - Full directory path with folder icons and separators
- **Command status indicators** - Visual feedback for successful/failed command execution (✓ or ✗)
- **Root user detection** - Lightning bolt (⚡) indicator when running as root
- **Transient prompt** - Clean, minimal second-line prompt for reduced history clutter
- **Multi-block layout** - Two-line prompt structure with left-aligned content

## 📦 Dependencies & Installation

### System Requirements

- **Operating System**: macOS, Linux, or Windows
- **Shell**: Zsh, Bash, PowerShell, Fish, etc.
- **Nerd Font**: Required for icons and symbols (recommended: GeistMono)
- **Go** (optional): For advanced theme development

### Install Oh My Posh

#### macOS

**Option 1: Homebrew (Recommended)**

```bash
brew install oh-my-posh
```

**Option 2: Direct Installation**

```bash
# Download latest release
curl -s https://ohmyposh.dev/install/unix.sh | bash -s

# Or with Homebrew (for M1/M2 Macs)
brew install JanDeDobbeleer/oh-my-posh/oh-my-posh
```

#### Linux

**Ubuntu/Debian:**

```bash
# Add repository
curl -s https://ohmyposh.dev/install/linux.sh | bash -s

# Or with package manager if available
sudo apt-get install oh-my-posh
```

**Fedora/CentOS:**

```bash
sudo dnf install oh-my-posh
# Or download from releases
```

**Arch Linux:**

```bash
yay -S oh-my-posh
# Or
sudo pacman -S oh-my-posh
```

#### Windows

**Option 1: Winget**

```powershell
winget install JanDeDobbeleer.OhMyPosh -e
```

**Option 2: Chocolatey**

```powershell
choco install oh-my-posh
```

**Option 3: Scoop**

```powershell
scoop install oh-my-posh
```

### 🎨 Nerd Fonts

Oh My Posh requires a Nerd Font for proper display of icons and symbols.

#### Install GeistMono Nerd Font

**macOS:**

```bash
brew install --cask font-geist-mono-nerd-font
```

**Linux:**

```bash
# Create fonts directory
mkdir -p ~/.local/share/fonts

# Download and extract font
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/GeistMono.zip
unzip GeistMono.zip

# Update font cache
fc-cache -fv
```

**Windows:**

1. Download from [Nerd Fonts](https://www.nerdfonts.com/)
2. Extract and install `.ttf` files
3. Select font in your terminal settings

#### Recommended Nerd Fonts

All Nerd Fonts work with Oh My Posh:

- **GeistMono Nerd Font** - Clean, modern (used in this config)
- **JetBrains Mono Nerd Font** - Developer-friendly
- **Fira Code Nerd Font** - Great ligatures
- **Ubuntu Mono Nerd Font** - Consistent with OS
- **Cascadia Code Nerd Font** - Microsoft's modern font
- **IBM Plex Mono Nerd Font** - Professional look

### 🎨 Colors & Theme

The `gedarufi.toml` theme uses the **Tokyo Night** color palette:

```toml
# Tokyo Night Palette
main-bg = "#24283b"          # Main background
dark-bg = "#1a1b26"          # Darker background
terminal-red = "#f7768e"     # Error/Important
pistachio-green = "#9ece6a"  # Success
terminal-green = "#73daca"   # Git modified
terminal-yellow = "#e0af68"  # Warnings
terminal-blue = "#7aa2f7"    # Info
terminal-magenta = "#bb9af7" # Status
terminal-orange = "#ff9e64"  # Highlights
```

Colors are optimized for:
- Clear visual distinction
- Reduced eye strain
- Good contrast on dark backgrounds
- Consistent with other Tokyo Night implementations

## 🔧 Configuration File

The configuration file location is: `~/.config/oh-my-posh/gedarufi.toml`

Or point to it from your shell profile:

**Zsh (~/.zshrc):**

```bash
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/gedarufi.toml)"
```

**Bash (~/.bashrc):**

```bash
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/gedarufi.toml)"
```

**PowerShell ($profile):**

```powershell
oh-my-posh init pwsh --config ~/.config/oh-my-posh/gedarufi.toml | Out-String | Invoke-Expression
```

### Theme Components

The theme includes:

1. **OS/System Info Segment**
   - Displays OS icon and name
   - Shows WSL indicator if in Windows Subsystem for Linux

2. **Working Directory Segment**
   - Current folder path
   - Shortened for readability

3. **Status Indicator Segment**
   - Shows last command exit code
   - ✓ for success, ✗ for failure
   - Color-coded (green/red)

4. **Root Indicator Segment**
   - Lightning bolt (⚡) when running as root
   - Appears only when needed

5. **Transient Prompt**
   - Simplified arrow prompt for command history
   - Clean looking terminal scrollback
   - Conditional coloring based on exit code

## 📥 Installation Steps

### 1. Install Oh My Posh

```bash
# macOS
brew install oh-my-posh

# Linux - Ubuntu/Debian
curl -s https://ohmyposh.dev/install/linux.sh | bash -s

# Or via package manager if available
```

### 2. Install Nerd Font

```bash
# macOS
brew install --cask font-geist-mono-nerd-font

# Linux
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/GeistMono.zip
unzip GeistMono.zip
fc-cache -fv
```

### 3. Create Configuration Directory

```bash
mkdir -p ~/.config/oh-my-posh
```

### 4. Copy Configuration

```bash
# Copy the theme file
cp oh-my-posh/gedarufi.toml ~/.config/oh-my-posh/gedarufi.toml
```

### 5. Integrate with Your Shell

**For Zsh:**

Add to `~/.zshrc`:

```bash
# Oh My Posh initialization
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/gedarufi.toml)"
```

**For Bash:**

Add to `~/.bashrc`:

```bash
# Oh My Posh initialization
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/gedarufi.toml)"
```

### 6. Reload Shell

```bash
# Zsh
exec zsh

# Or Bash
exec bash

# Or manually source
source ~/.zshrc
```

The prompt should now display with all customizations!

## ⚙️ Customization

### Create Custom Theme

Create a new theme file `~/.config/oh-my-posh/custom.toml`:

```toml
"$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json"

version = 4
final_space = true

[palette]
# Define your colors here
my-color = "#FF5733"

[[blocks]]
alignment = "left"
type = "prompt"

  [[blocks.segments]]
  type = "os"
  style = "powerline"
  template = " {{ .Icon }} "
```

### Modify Colors

Edit the `[palette]` section in `gedarufi.toml`:

```toml
[palette]
my-custom-color = "#YOUR-HEX-COLOR"
```

Then use in segments:

```toml
[[blocks.segments]]
foreground = "p:my-custom-color"
```

### Add Segments

Add new blocks to show additional information:

```toml
[[blocks.segments]]
type = "docker"
style = "powerline"
template = " Docker: {{ .Context }} "
```

Available segment types:
- `git` - Git information
- `os` - Operating system
- `shell` - Current shell
- `battery` - Battery status
- `time` - Current time
- `weather` - Weather information
- Many more...

### Change Prompt Symbol

Modify the transient prompt template:

```toml
[transient_prompt]
template = ">>> "  # Change to your preferred symbol
```

## 🎯 Prompt Showcase

The prompt typically displays:

```
⚡ 🍎 macOS  user  ~/projects/zsh-configuration  ✓
❯ 
```

Components (first line, left-aligned):
- ⚡ - Cyan indicator (OS identifier)
- 🍎 - OS icon (macOS, Linux, Windows, etc.)
- user - Current username in light blue
- ~/projects/zsh-configuration - Current directory path
- ✓ - Green checkmark for successful command

Components (second line):
- ⚡ - Yellow lightning bolt (appears only when running as root)
- ❯ - Prompt symbol, colored by last command result (magenta for success, red for failure)

## 🐛 Troubleshooting

### Icons not displaying

1. Verify Nerd Font is installed and selected in terminal
2. Check font name matches terminal settings
3. Try restarting terminal application

### Prompt not appearing

```bash
# Check Oh My Posh installation
which oh-my-posh

# Verify configuration file
cat ~/.config/oh-my-posh/gedarufi.toml

# Test initialization
oh-my-posh init zsh --config ~/.config/oh-my-posh/gedarufi.toml
```

### Colors look wrong

1. Ensure terminal supports 256 colors
2. Verify theme colors in configuration file
3. Try different color values or use official Oh My Posh themes

### Slow prompt rendering

```bash
# Profile prompt performance
time oh-my-posh init zsh --config ~/.config/oh-my-posh/gedarufi.toml

# Disable heavy segments if needed
# Remove git segment if too slow in large repos
```

### Git segment not updating

```bash
# Ensure git is installed
which git

# Check repository status
git status

# Rebuild prompt cache
```

## 📚 Resources

- [Oh My Posh Official Website](https://ohmyposh.dev/)
- [Oh My Posh Documentation](https://ohmyposh.dev/docs)
- [Theme Gallery](https://ohmyposh.dev/docs/themes)
- [Configuration Schema](https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json)
- [Tokyo Night Theme](https://github.com/enkia/tokyo-night-vscode-theme)
- [Nerd Fonts](https://www.nerdfonts.com/)

## 🎯 Tips & Tricks

1. **Performance**: Disable git segment in very large repositories
2. **Segments**: Mix and match segments to show what matters to you
3. **Colors**: Use colors that match your terminal theme for consistency
4. **Testing**: Use `oh-my-posh config` command to preview changes
5. **Backup**: Save custom themes to version control (like this repo!)

## ℹ️ Notes

- Oh My Posh is actively maintained with regular updates
- Theme uses standardized segment types for reliability
- Colors can be easily modified without breaking functionality
- Works seamlessly with other terminal tools (Tmux, developers shells)
- Tokyo Night palette reduces eye strain for long development sessions
