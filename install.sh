#!/bin/bash
# Dotfiles install script
# Run once on a new machine after cloning the repo

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

symlink() {
  local src="$1" dst="$2"
  if [[ -f "$dst" && ! -L "$dst" ]]; then
    echo "Backing up existing $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sf "$src" "$dst"
  echo "Linked $dst"
}

# Base configs
symlink "$DOTFILES/.zshrc"  ~/.zshrc
symlink "$DOTFILES/.vimrc"  ~/.vimrc

# Server-specific (only if .zshrc.server exists in repo)
if [[ -f "$DOTFILES/.zshrc.server" ]]; then
  symlink "$DOTFILES/.zshrc.server" ~/.zshrc.server
  symlink ~/.zshrc.server ~/.zshrc.local
  echo "Server profile active via ~/.zshrc.local"
fi

echo "Done. Reload shell: exec zsh"
