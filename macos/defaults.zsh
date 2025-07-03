#!/bin/zsh

if [ "$(uname)" != "Darwin" ]; then
  echo "Not macOS!"
  exit 1
fi

# 基本設定
defaults write com.apple.HIToolbox AppleFnUsageType -int 2
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# デスクトップサービス
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Dock
defaults write com.apple.dock autohide-delay -float 0

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# メニューバーの表示
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'

# ターミナル
defaults write com.apple.terminal StringEncodings -array 4

# 再起動
for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" &>/dev/null
done