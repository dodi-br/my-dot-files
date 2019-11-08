#!/bin/bash

# Hello World, welcome to my dotfiles !!

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DOTFILES_DIR/.exports"
source "utils/helpers.sh"

#source "main/prepare.sh"

# 1) Git configuration
#source "main/git.sh"

# 2) OhMyZsh
source "main/zsh.sh"

# 3) Homebrew
#source "main/homebrew.sh"