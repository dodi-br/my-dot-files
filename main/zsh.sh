#!/bin/bash

# ZSH configuration for Dodi's Dotfiles
ZSH_CUSTOM="$ZSH/custom"

if dir_exists $ZSH; then
    p_warning "Oh My Zsh is already installed. Skipping.."
else
    p_header "Installing Oh My Zsh..."
    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

    if ! dir_exists "$ZSH_CUSTOM/themes/spaceship-prompt"; then
        p_note "Installing Oh My Zsh SPACESHIP THEME ..."
        git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
        ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"
    else
        p_note "SPACESHIP THEME already installed, skipping ..."
    fi

    ln -sfv "$DOTFILES_DIR/zsh/.zshrc" ~
    ln -sfv "$DOTFILES_DIR/.exports" ~
fi

p_note "Checking default shell"
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        p_note "Switching default sheel to ZSH"
        sudo chsh -s $(which zsh)
    else
        p_note "Default shell is already ZSH ... skipping"
    fi
fi