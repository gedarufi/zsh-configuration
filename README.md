# dotfiles

Personal terminal setup for macOS and Linux. Combines Zsh, Ghostty, Oh My Posh, and Tmux with a Tokyo Night Storm color scheme.

## Quick install

```bash
git clone https://github.com/gedarufi/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

Non-interactive (installs everything):

```bash
./install.sh --all
```

## What's included

| Component | Config | Description |
|-----------|--------|-------------|
| Zsh | `zsh/.zshrc` | Zinit plugins, aliases, tool inits |
| Ghostty | `ghostty/config` | Tokyo Night Storm, GeistMono 19pt |
| Oh My Posh | `oh-my-posh/gedarufi.toml` | OS + path + git + status segments |
| Tmux | `tmux/tmux.conf` | 11 plugins, tmux2k theme, sessionx |

## install.sh

Detects OS and uses the appropriate package manager:

| OS | Package manager |
|----|----------------|
| macOS | Homebrew |
| Ubuntu / Debian | apt |
| Fedora / RHEL | dnf |
| Arch / Manjaro | pacman |
| openSUSE | zypper |

Interactive menu lets you pick which components to install. All config files are symlinked (not copied) so `git pull` keeps them up to date.

## Requirements

- [GeistMono Nerd Font](https://www.nerdfonts.com/) for icons
- macOS: Homebrew (install.sh installs it if missing)
- Linux: git + curl

## Tmux plugins

After running `install.sh` with tmux selected, open tmux and press `prefix + I` to install plugins via tpm.

## Secrets

Sensitive environment variables go in `~/.secrets` (not tracked). The `.zshrc` sources it automatically if it exists.
