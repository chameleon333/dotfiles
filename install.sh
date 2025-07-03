#!/bin/bash

echo "⚙️ Setting up dotfiles..."

# zsh 設定
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

# zplug
if [ ! -d ~/.zplug ]; then
  echo "📦 Installing zplug..."
  curl -sL https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# macOS 設定
if [ "$(uname)" == "Darwin" ]; then
  echo "🍎 Applying macOS defaults..."
  zsh ~/.dotfiles/macos/defaults.zsh
fi

echo "✅ Done!"