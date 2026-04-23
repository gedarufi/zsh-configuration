# Ghostty Terminal Emulator Configuration

[Ghostty](https://ghostty.org/) - A fast, feature-rich terminal emulator written in Zig. This configuration provides a modern, visually appealing terminal environment with Tokyo Night theme and optimized settings for development.

## 📋 Overview

Ghostty is a next-generation terminal emulator offering:

- **Fast Performance** - Efficient rendering and responsiveness
- **GPU Acceleration** - Smooth visual experience
- **Cross-Platform** - Runs on macOS, Linux, and Windows
- **Modern Features** - Shell integration, custom themes, and extensive configuration
- **Beautiful Aesthetics** - Tokyo Night theme with visual effects

This configuration provides:
- Modern monospace font (GeistMono Nerd Font)
- Tokyo Night Storm theme
- Shell integration for enhanced CLI experience
- Mouse and keyboard optimization
- Visual enhancements (blur effects)

## 📦 Dependencies & Installation

### System Requirements

- **Operating System**: macOS, Linux, or Windows
- **Nerd Font**: For proper icon and symbol display (recommended: GeistMono)
- **Optional**: Homebrew (for easy installation on macOS/Linux)

### Install Ghostty

#### macOS

**Option 1: Homebrew (Recommended)**

```bash
brew install ghostty
```

**Option 2: Direct Download**

1. Download from [Ghostty Releases](https://github.com/ghostty-org/ghostty/releases)
2. Extract and follow installation instructions

#### Linux

**Ubuntu/Debian:**

```bash
# Add Ghostty PPA (if available)
# Or download from GitHub releases
wget https://github.com/ghostty-org/ghostty/releases/download/v1.x.x/ghostty-linux-x86_64.tar.gz
tar -xzf ghostty-linux-x86_64.tar.gz
# Follow extraction instructions
```

**Fedora/CentOS:**

```bash
sudo dnf install ghostty
# Or download from releases
```

**Arch Linux:**

```bash
yay -S ghostty
# Or from GitHub releases
```

#### Windows

**Option 1: Winget**

```powershell
winget install Ghostty
```

**Option 2: Direct Download**

1. Download from [Ghostty Releases](https://github.com/ghostty-org/ghostty/releases)
2. Run installer

### 🎨 Nerd Fonts

Ghostty requires a Nerd Font for proper display of icons and symbols.

#### Install GeistMono Nerd Font

**macOS:**

```bash
brew install --cask font-geist-mono-nerd-font
```

**Linux:**

```bash
# Download from Nerd Fonts website
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/GeistMono.zip
unzip GeistMono.zip
fc-cache -fv
```

**Windows:**

1. Download GeistMono from [Nerd Fonts](https://www.nerdfonts.com/)
2. Extract and double-click `.ttf` files to install

#### Alternative Nerd Fonts

- **JetBrains Mono Nerd Font** - Great for coding
- **Fira Code Nerd Font** - Excellent ligature support
- **Ubuntu Mono Nerd Font** - System-consistent
- **Cascadia Code Nerd Font** - Modern and clean

### 🎨 Tokyo Night Theme

The configuration uses the **Tokyo Night Storm** theme, which provides:

- Dark background with comfortable contrast
- Easy on the eyes for long coding sessions
- Color palette optimized for syntax highlighting
- Consistent with other terminal tools

The theme is built-in to Ghostty and automatically applied through the configuration.

## 🔧 Configuration File

The configuration file location is: `~/.config/ghostty/config`

### Configuration Contents

```ini
font-family = "GeistMono Nerd Font Mono"
font-size = 19
background-blur-radius = 20
mouse-hide-while-typing = true
window-decoration = false
macos-option-as-alt = true
theme = TokyoNight Storm
shell-integration = detect
shell-integration-features = cursor,sudo,title
mouse-shift-capture = false
```

### Configuration Breakdown

| Setting | Purpose |
|---------|---------|
| `font-family` | Specifies the terminal font (requires Nerd Font) |
| `font-size` | Controls text size (adjust 12-24 to preference) |
| `background-blur-radius` | Background blur effect (0-50, 0 = disabled) |
| `mouse-hide-while-typing` | Auto-hide cursor while typing |
| `window-decoration` | Show window title bar (false for minimal style) |
| `macos-option-as-alt` | macOS-specific: Use Option key as Alt |
| `theme` | Color scheme selection |
| `shell-integration` | Auto-detect and enable shell features |
| `shell-integration-features` | Specific integrations (cursor, sudo, title) |
| `mouse-shift-capture` | Shift+mouse behavior configuration |

## 📥 Installation Steps

### 1. Install Ghostty

Follow the instructions in the [Install Ghostty](#install-ghostty) section above.

### 2. Install Nerd Font

```bash
# macOS
brew install --cask font-geist-mono-nerd-font

# Linux
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/GeistMono.zip -O /tmp/GeistMono.zip
unzip /tmp/GeistMono.zip -d ~/.local/share/fonts
fc-cache -fv
```

### 3. Copy Configuration

```bash
# Create config directory if it doesn't exist
mkdir -p ~/.config/ghostty

# Copy the configuration file
cp ghostty/config ~/.config/ghostty/config
```

### 4. Launch Ghostty

```bash
ghostty
```

The terminal should load with:
- GeistMono Nerd Font
- Tokyo Night Storm theme
- All specified settings applied

### 5. Verify Installation

- Check that icons and symbols display correctly
- Test mouse cursor hiding while typing
- Verify terminal window appearance

## ⚙️ Customization

### Change Font

Edit `~/.config/ghostty/config` and modify:

```ini
font-family = "Your Font Name"
font-size = 16
```

Restart Ghostty for changes to take effect.

### Change Theme

Replace `TokyoNight Storm` with other available themes:

```ini
theme = Dracula
# or
theme = Nord
# or
theme = Gruvbox Dark
```

### Adjust Font Size

Quick zoom in/out:

```bash
# Default key combinations usually work:
# macOS: Cmd + Plus/Minus
# Linux: Ctrl + Plus/Minus
```

Or set permanent size in config:

```ini
font-size = 18
```

### Enable/Disable Features

Toggle features by editing the config:

```ini
# Disable background blur
background-blur-radius = 0

# Show window decorations
window-decoration = true

# Disable shell integration
shell-integration = false
```

### Padding & Margins

Additional configuration options:

```ini
window-padding-x = 10
window-padding-y = 10
cursor-bar-thickness = 2
```

## 🐛 Troubleshooting

### Font icons not displaying

1. Verify Nerd Font installation:
   ```bash
   # macOS
   ls ~/Library/Fonts | grep -i nerd
   
   # Linux
   ls ~/.local/share/fonts | grep -i nerd
   ```

2. Confirm font selection in Ghostty config
3. Try a different Nerd Font

### Blur effect not working

- Blur requires GPU acceleration
- On Linux, ensure graphics drivers are installed
- Try disabling and re-enabling blur

### Terminal appears too small/large

Adjust `font-size` in configuration:

```bash
# Open config
nano ~/.config/ghostty/config

# Change font-size value and save
# Restart Ghostty
```

### Performance issues

Try these optimizations:

```ini
# Disable blur effect
background-blur-radius = 0

# Reduce window size temporarily to test
# Check system resources
```

### Shell integration not working

```bash
# Verify shell compatibility
echo $SHELL

# Update shell profile to enable integration
# Restart Ghostty
```

## 📚 Resources

- [Ghostty Official Website](https://ghostty.org/)
- [Ghostty GitHub Repository](https://github.com/ghostty-org/ghostty)
- [Ghostty Documentation](https://ghostty.org/docs)
- [Tokyo Night Theme](https://github.com/enkia/tokyo-night-vscode-theme)
- [Nerd Fonts](https://www.nerdfonts.com/)

## 🎯 Tips & Tricks

1. **Use Keyboard Shortcuts**: Learn Ghostty's keybindings for faster navigation
2. **Combine with Tmux**: Use alongside tmux for enhanced terminal management
3. **Custom Theme**: Create custom themes by editing configuration
4. **Performance**: Use in combination with fast shells (Zsh with plugins)
5. **Integration**: Pair with fzf for fuzzy file/command searching

## ℹ️ Notes

- Ghostty is actively developed with regular updates
- Configuration is simple and human-readable
- Supports multiple terminals in tabs/windows for workflow efficiency
- Cross-platform consistency makes switching systems seamless
- Tokyo Night theme is designed for reduced eye strain during long sessions
