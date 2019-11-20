p_header "VsCode, morph!!!!"

while read EXTENSION
do
#   echo_info "Install VSCode Extension: $EXTENSION"
    p_note "Installing Extension: $EXTENSION"
    code --install-extension $EXTENSION
done < $DOTFILES_DIR/vscode/extensions
