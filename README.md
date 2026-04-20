# zsh-configuration

A personal Z shell configuration repository using a custom `.zshrc` and an Oh My Posh theme inspired by `iterm2.omp.json`.

## Overview

This repo contains my personal Zsh configuration files for a polished shell experience on Mac Os / Linux. It includes:

- `.zshrc` with aliases, prompt settings, and shell options
- `.oh-my-posh/` theme files for a visually rich prompt

## Features

- Custom Zsh prompt styling
- Convenient aliases and shell productivity helpers
- Oh My Posh integration for a modern terminal theme
- Easy to install and reuse in other environments

## Installation

1. Clone the repository:

```bash
git clone https://github.com/gedarufi/zsh-configuration.git
cd zsh-configuration
```

2. Copy the configuration files to your home directory:

```bash
cp .zshrc ~/.zshrc
cp -r .oh-my-posh ~/.oh-my-posh
```

3. Install `zsh` and `oh-my-posh` if not already installed.

4. Restart your terminal or reload Zsh:

```bash
source ~/.zshrc
```

## Usage

After installation, Zsh will use the provided configuration and theme files. Customize the `.zshrc` file to add personal aliases, functions, or shell options.

## Customization

- Edit `~/.zshrc` to tweak prompt behavior, history settings, plugins, and aliases.
- Update the theme files inside `~/.oh-my-posh` to adjust colors or prompt segments.

## Notes

This setup is intended for personal use and may include preferences specific to my workflow. Use it as a starting point for your own Zsh environment.

## License

Feel free to reuse or adapt this configuration for your own shell setup.