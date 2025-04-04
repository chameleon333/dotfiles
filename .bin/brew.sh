#!/bin/zsh

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "🔧 Homebrew is not installed. Installing now..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for Apple Silicon
  if [ -d "/opt/homebrew/bin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  # Add Homebrew to PATH for Intel Mac
  elif [ -d "/usr/local/bin" ]; then
    eval "$(/usr/local/bin/brew shellenv)"
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
  fi
fi

# Check operating system
if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

function open_app_store {
  echo "Please login with your Apple ID"
  sleep 1; echo "Open the App Store."
  sleep 1; open -a App\ Store
}

function login_check {
  while true; do
    echo -n "$* [Y/n]: (default: n) "
    read ANS
    case $ANS in
      [Yy]*)
        return 0
        ;;
      *)
        open_app_store
        ;;
    esac
  done
}

open_app_store
if login_check "Did you login?"; then
  brew bundle --global
fi