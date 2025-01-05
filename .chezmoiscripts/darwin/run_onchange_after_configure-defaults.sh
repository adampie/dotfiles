#!/bin/bash

set -eufo pipefail

trap 'killall "Dock" "Finder"' EXIT

# Dock
defaults write com.apple.dock "autohide" -bool "true" 
defaults write com.apple.dock "autohide-time-modifier" -float "0.4"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "tilesize" -int "30"

# Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

# Mission Control
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool "true"
defaults write NSGlobalDomain "com.apple.mouse.tapBehavior" -int "1"
defaults write NSGlobalDomain "com.apple.swipescrolldirection" -bool "false"

# Apple Intelligence
defaults write com.apple.AppleIntelligenceReport "reportDuration" -int "0"
