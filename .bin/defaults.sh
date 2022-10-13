#!/bin/zsh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ====================
#
# Base
#
# ====================

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always display scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Key repeat speed
defaults write NSGlobalDomain KeyRepeat -int 2

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Timing to start key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# ====================
#
# DesktopServices
#
# ====================

# Do not create .DS_Store files on USB or network storage
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ====================
#
# Dock
#
# ====================

# Disable waiting time before the Dock is displayed
defaults write com.apple.dock autohide-delay -float 0

# Disable animation at application launch
# defaults write com.apple.dock launchanim -bool false

# ====================
#
# Finder
#
# ====================


# Disable animation
# defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true


# ====================
#
# SystemUIServer
#
# ====================

# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'

# Display battery level in the menu bar
# defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# ====================
#
# Terminal
#
# ====================

# Use UTF-8 only
defaults write com.apple.terminal StringEncodings -array 4

for app in "Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done
