#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

step()           { echo -e "\n${BLUE}==>${NC} ${BOLD}$*${NC}"; }
ok()             { echo -e "  ${GREEN}✓${NC} $*"; }
warn()           { echo -e "  ${YELLOW}!${NC} $*"; }
info()           { echo -e "  ${CYAN}·${NC} $*"; }
command_exists() { command -v "$1" &>/dev/null; }

# ── OS Detection ──────────────────────────────────────────────────────────────
OS=""

detect_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"; return
  fi
  if [[ -f /etc/os-release ]]; then
    # shellcheck disable=SC1091
    source /etc/os-release
    case "${ID:-}" in
      ubuntu|debian|linuxmint|pop|elementary) OS="debian" ;;
      fedora|rhel|centos|rocky|almalinux)     OS="fedora" ;;
      arch|manjaro|endeavouros|garuda)        OS="arch"   ;;
      opensuse*|sles)                         OS="suse"   ;;
      *)                                      OS="linux"  ;;
    esac
  else
    OS="linux"
  fi
}

# ── Package Manager ────────────────────────────────────────────────────────────
pkg_install() {
  case "$OS" in
    macos)  brew install "$@" ;;
    debian) sudo apt-get install -y "$@" ;;
    fedora) sudo dnf install -y "$@" ;;
    arch)   sudo pacman -S --noconfirm --needed "$@" ;;
    suse)   sudo zypper install -yn "$@" ;;
    *)      warn "Unknown OS — cannot install: $*" ;;
  esac
}

pkg_update() {
  case "$OS" in
    macos)  ;;
    debian) sudo apt-get update -q ;;
    fedora) sudo dnf check-update -q || true ;;
    arch)   sudo pacman -Sy ;;
    suse)   sudo zypper refresh ;;
  esac
}

# ── Symlink Helper ────────────────────────────────────────────────────────────
link_file() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    warn "Backing up: $dst → $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sf "$src" "$dst"
  ok "linked: $dst"
}

# ── Homebrew ──────────────────────────────────────────────────────────────────
ensure_brew() {
  if ! command_exists brew; then
    step "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"
  fi
}

# ── Groups ────────────────────────────────────────────────────────────────────
install_cli_tools() {
  step "CLI Tools (eza, bat, ripgrep, fd, fzf, zoxide, btop)"
  case "$OS" in
    macos)
      pkg_install fzf zoxide eza bat ripgrep fd btop
      ;;
    debian)
      pkg_install fzf bat ripgrep btop fd-find
      sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd 2>/dev/null || true
      _install_eza_linux
      curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
      ;;
    fedora)
      pkg_install fzf bat ripgrep btop fd-find
      _install_eza_linux
      curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
      ;;
    arch)
      pkg_install fzf zoxide eza bat ripgrep fd btop
      ;;
    suse)
      pkg_install fzf bat ripgrep fd btop
      _install_eza_linux
      curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
      ;;
  esac
}

_install_eza_linux() {
  if command_exists eza; then info "eza already installed"; return; fi
  info "Installing eza from binary release..."
  local arch arch_tag tag
  arch=$(uname -m)
  case "$arch" in
    x86_64)  arch_tag="x86_64-unknown-linux-musl" ;;
    aarch64) arch_tag="aarch64-unknown-linux-musl" ;;
    *)       warn "Unsupported arch for eza: $arch"; return ;;
  esac
  tag=$(curl -sfL "https://api.github.com/repos/eza-community/eza/releases/latest" \
        | grep '"tag_name"' | cut -d'"' -f4)
  curl -sSfL "https://github.com/eza-community/eza/releases/download/${tag}/eza_${arch_tag}.tar.gz" \
    | tar -xz -C /tmp eza
  sudo mv /tmp/eza /usr/local/bin/eza
  ok "eza installed"
}

install_shell() {
  step "Shell (zsh + zinit config)"
  case "$OS" in
    macos) info "zsh is default on macOS" ;;
    *)
      pkg_install zsh
      if [[ "$SHELL" != "$(which zsh)" ]]; then
        chsh -s "$(which zsh)" 2>/dev/null || warn "Run manually: chsh -s \$(which zsh)"
      fi
      ;;
  esac
  link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
  [[ -f "$DOTFILES_DIR/zsh/.zprofile" ]] && \
    link_file "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
  info "zinit will auto-install on next zsh launch"
}

install_prompt() {
  step "Prompt (oh-my-posh)"
  if ! command_exists oh-my-posh; then
    case "$OS" in
      macos) brew install jandedobbeleer/oh-my-posh/oh-my-posh ;;
      *)
        mkdir -p "$HOME/.local/bin"
        curl -s https://ohmyposh.dev/install.sh | bash -s -- -d "$HOME/.local/bin"
        ;;
    esac
  else
    info "oh-my-posh already installed"
  fi
  mkdir -p "$HOME/.oh-my-posh"
  link_file "$DOTFILES_DIR/oh-my-posh/gedarufi.toml" "$HOME/.oh-my-posh/gedarufi.toml"
}

install_editor() {
  step "Editor (neovim)"
  if ! command_exists nvim; then
    case "$OS" in
      macos)  pkg_install neovim ;;
      debian)
        if command_exists add-apt-repository; then
          sudo add-apt-repository -y ppa:neovim-ppa/unstable 2>/dev/null \
            && sudo apt-get update -q || true
        fi
        pkg_install neovim
        ;;
      *) pkg_install neovim ;;
    esac
  else
    info "neovim already installed"
  fi
  [[ -d "$DOTFILES_DIR/config/nvim" ]] && \
    link_file "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"
}

install_tmux() {
  step "Tmux + tpm"
  command_exists tmux || pkg_install tmux
  if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone --depth=1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    ok "tpm installed"
  else
    info "tpm already installed"
  fi
  link_file "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
  link_file "$DOTFILES_DIR/tmux/tmux.reset.conf" "$HOME/.config/tmux/tmux.reset.conf"
  info "Inside tmux: prefix + I to install plugins"
}

install_node() {
  step "Node.js (fnm, bun, pnpm)"
  if ! command_exists fnm; then
    curl -fsSL https://fnm.vercel.app/install | bash; ok "fnm installed"
  else info "fnm already installed"; fi
  if ! command_exists bun; then
    curl -fsSL https://bun.sh/install | bash; ok "bun installed"
  else info "bun already installed"; fi
  if ! command_exists pnpm; then
    curl -fsSL https://get.pnpm.io/install.sh | sh -; ok "pnpm installed"
  else info "pnpm already installed"; fi
}

install_ghostty() {
  step "Terminal (ghostty config)"
  if [[ "$OS" != "macos" ]]; then
    warn "ghostty config is macOS-only in this setup"; return
  fi
  link_file "$DOTFILES_DIR/ghostty/config" \
    "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
}

# ── Interactive Menu ──────────────────────────────────────────────────────────
GROUP_KEYS=()
GROUP_LABELS=()
SELECTED_KEYS=()

setup_groups() {
  GROUP_KEYS=(cli_tools shell prompt editor tmux node)
  GROUP_LABELS=(
    "CLI Tools    (eza, bat, ripgrep, fd, fzf, zoxide, btop)"
    "Shell        (zsh + zinit config)"
    "Prompt       (oh-my-posh)"
    "Editor       (neovim)"
    "Tmux         (tmux + tpm)"
    "Node.js      (fnm, bun, pnpm)"
  )
  if [[ "$OS" == "macos" ]]; then
    GROUP_KEYS+=(ghostty)
    GROUP_LABELS+=("Terminal     (ghostty config symlink)")
  fi
}

select_groups() {
  echo -e "\n${BOLD}Select components to install:${NC}"
  echo -e "  ${CYAN}0${NC}) ${BOLD}All${NC}"
  local i=1
  for label in "${GROUP_LABELS[@]}"; do
    printf "  ${CYAN}%d${NC}) %s\n" "$i" "$label"
    ((i++))
  done
  echo ""

  local selection
  read -rp "Numbers separated by spaces (e.g: 1 3 5), or 0 for all: " selection

  if [[ -z "$selection" || "$selection" == "0" ]]; then
    SELECTED_KEYS=("${GROUP_KEYS[@]}"); return
  fi

  SELECTED_KEYS=()
  for num in $selection; do
    if [[ "$num" =~ ^[0-9]+$ ]] && (( num >= 1 && num <= ${#GROUP_KEYS[@]} )); then
      SELECTED_KEYS+=("${GROUP_KEYS[$((num - 1))]}")
    else
      warn "Invalid: $num (ignored)"
    fi
  done
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
  detect_os
  echo -e "${BOLD}dotfiles installer${NC} — OS: ${CYAN}${OS}${NC}"

  [[ "$OS" == "macos" ]] && ensure_brew
  pkg_update
  setup_groups

  if [[ "${1:-}" == "--all" ]]; then
    SELECTED_KEYS=("${GROUP_KEYS[@]}")
  else
    select_groups
  fi

  if [[ ${#SELECTED_KEYS[@]} -eq 0 ]]; then
    warn "Nothing selected. Exiting."; exit 0
  fi

  for key in "${SELECTED_KEYS[@]}"; do
    case "$key" in
      cli_tools) install_cli_tools ;;
      shell)     install_shell     ;;
      prompt)    install_prompt    ;;
      editor)    install_editor    ;;
      tmux)      install_tmux      ;;
      node)      install_node      ;;
      ghostty)   install_ghostty   ;;
    esac
  done

  echo -e "\n${GREEN}${BOLD}Done!${NC}"
  echo -e "Restart shell or run: ${CYAN}source ~/.zshrc${NC}"
}

main "$@"
