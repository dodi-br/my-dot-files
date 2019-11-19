#!/bin/bash

# Brew configuration for Dodi's Dotfiles

BREW_BUNDLE_DIR="$DOTFILES_DIR/brew/brewfile"
CASK_BUNDLE_DIR="$DOTFILES_DIR/brew/caskfile"

p_header "Its Homebrew time..."
if test ! $(which brew); then
  p_note "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  p_warning "Homebrew is already installed. Skipping.."
fi

p_note "Updating Homebrew"
brew update
p_note "Upgrading Homebrew"
brew upgrade

BREW_PREFIX=$(brew --prefix)

if file_exists $BREW_BUNDLE_DIR; then
  p_note "Installing brew packages"
  brew bundle --file="$BREW_BUNDLE_DIR"
fi

if file_exists $CASK_BUNDLE_DIR; then
  p_note "Installing cask packages"
  brew bundle --file="$CASK_BUNDLE_DIR"
fi

brew cleanup
