# Pull in defaults from homeshick + dotfiles
test -e "${HOME}/.bashrc" && source "${HOME}/.bashrc"

# Enable iTerm2 shell integration when present
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Run fastfetch if installed
test -x "$(which fastfetch)" && fastfetch && echo ""
