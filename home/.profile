# Pull in defaults from homeshick + dotfiles - only on Bash
if [ -n "$BASH" ]; then
  test -e "${HOME}/.bashrc" && source "${HOME}/.bashrc"
fi

# Enable iTerm2 shell integration when present - Mac only
if [ "$(uname -s)" = "Darwin" ]; then
  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
fi

# Run fastfetch if installed
test -x "$(which fastfetch 2>/dev/null)" && fastfetch && echo ""
