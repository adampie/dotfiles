#!/bin/bash

set -eufo pipefail

trap 'killall "Dock"' EXIT

# Dock
defaults write com.apple.dock "autohide" -bool "true" 
defaults write com.apple.dock "autohide-time-modifier" -float "0.4"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "tilesize" -int "30"
