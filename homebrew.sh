#!/usr/bin/env bash

declare -a taps=(
	"homebrew/cask-fonts"
)

declare -a system_brews=(
    "htop"
    "zsh"
    "starship"
    "mas"
    "bash"
    "git"
)

declare -a user_brews=(
    "awscli"
    "terraform"
    "go"
    "node"
	"pre-commit"
	"tflint"
	"terraform-docs"
)

declare -a casks=(
	"visual-studio-code"
	"iterm2"
	"1password"
	"tower"
    "font-hack"
    "jetbrains-toolbox"
)

# Install CommandLineTools
if ! [ -d "/Library/Developer/CommandLineTools" ]; then
    sudo xcode-select --install
else
    echo " INSTALL => CommandLineTools already installed."
fi

# Install Homebrew
if ! hash brew 2>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew analytics off
else
    echo " INSTALL => Homebrew already installed."
fi

# Install taps
for tap in "${taps[@]}"
do
   brew tap "$tap"
done

# Install brews
for brew in "${system_brews[@]}"
do
    if ! hash $brew 2>/dev/null; then
        brew install "$brew"
    else
        echo "HOMEBREW => $brew already installed."
    fi   
done

for brew in "${user_brews[@]}"
do
    if ! hash $brew 2>/dev/null; then
        if [ "$brew" = "awscli" ]; then
            if hash aws 2>/dev/null; then
                echo "HOMEBREW => $brew already installed."
            fi
        else
            brew install "$brew"
        fi
    else
        echo "HOMEBREW => $brew already installed."
    fi   
done

# Install casks
for cask in "${casks[@]}"
do
    if [ ! -d "/usr/local/Caskroom/$cask" ] 2>/dev/null; then
        brew cask install "$cask"
    else
        echo "HOMEBREW => $cask already installed."
    fi   
done

# Install oh-my-zsh
if [ ! -f ~/.zshrc ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp .zshrc ~/.zshrc
else
    echo " INSTALL => oh-my-zsh already installed."
fi

brew update
brew upgrade
brew cleanup
