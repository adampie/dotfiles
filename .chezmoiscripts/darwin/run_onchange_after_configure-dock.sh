#!/bin/bash

set -euo pipefail

trap 'killall "Dock"' EXIT

dockutil --remove all --no-restart

# Launchpad
dockutil --add /System/Applications/Launchpad.app --no-restart

# Safari
dockutil --add /System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app --no-restart

# Ghostty
dockutil --add /Applications/Ghostty.app --no-restart

# System Settings
dockutil --add "/System/Applications/System Settings.app" --no-restart

# Downloads
dockutil --add /Users/adampie/Downloads/ --type directory --section others --no-restart
