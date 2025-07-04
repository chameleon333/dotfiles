#!/bin/zsh

if [ "$(uname)" != "Darwin" ]; then
  echo "Not macOS!"
  exit 1
fi

# Homebrewのインストール
if ! command -v brew &> /dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # PATH設定（Apple Silicon MacとIntel Mac両方に対応）
  if [[ $(uname -m) == 'arm64' ]]; then
    # Apple Silicon Mac
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    export PATH="/opt/homebrew/bin:$PATH"
  else
    # Intel Mac
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
    export PATH="/usr/local/bin:$PATH"
  fi
else
  echo "🍺 Homebrew is already installed"
fi

# 既にインストールされている場合のPATH設定
if [[ $(uname -m) == 'arm64' ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
else
  export PATH="/usr/local/bin:$PATH"
fi

# brewコマンドが利用可能かチェック
if ! command -v brew &> /dev/null; then
  echo "❌ Homebrew is not available in PATH. Please restart your terminal and try again."
  exit 1
fi

# Homebrewの更新
echo "🔄 Updating Homebrew..."
brew update

# よく使うパッケージのインストール
echo "📦 Installing common packages..."

# 開発ツール
brew install git
brew install gh
brew install node
brew install python

# ユーティリティ
brew install wget
brew install curl
brew install jq
brew install tree

# エディタ
brew install --cask visual-studio-code
brew install --cask iterm2

# ブラウザ
brew install --cask google-chrome

# その他
brew install --cask docker
brew install --cask slack
brew install --cask clipy

echo "✅ Homebrew setup completed!"