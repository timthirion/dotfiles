#!/usr/bin/env bash

#printf "\nSetting sensible OS X defaults\n"

# Set the fastest possible key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# Enable the 2D Dock
defaults write com.apple.dock no-glass -bool true

# Disable menu bar transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Reverse the scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

#
# Finder
#

# Finder: Disable all animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: Show hidden files by default
#defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder: Empty the trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Finder : Set default folder
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file:///${HOME}"

#echo "Done"
