#!/bin/bash

# Git account configuration for Dodi's Dotfiles

p_header "Global git config"
cp gitignore ~/.gitignore_global  ## Setting global gitignore
git config --global core.excludesfile "${HOME}/.gitignore_global"

ask "${blue} (Option) Enter your Github account email: "
read -r emailId
if is_empty $emailId; then
  git config --global user.email "$emailId"
  p_success "Email is set"
else
  p_error "Not set"
fi

ask "${blue} (Option) Enter your Github account username: "
read -r userName
if is_empty $userName; then
  git config --global user.name "$userName"
  p_success "Username is set"
else
  p_error "Not set"
fi