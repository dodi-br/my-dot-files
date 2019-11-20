p_header "Some MacOs defaults"
for DEFAULTS_FILE in "${DOTFILES_DIR}"/macos/*.sh; do
    p_note "  Applying ${DEFAULTS_FILE}" && . "${DEFAULTS_FILE}"
done
p_note "Done. Some changes may require a logout/restart to take effect."