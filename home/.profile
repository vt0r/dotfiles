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

# Setting PATH for Python framework bundle (only on macOS, only when installed)
if is_macos; then
  VER="3.14"  # Is there a better/automated way to handle this?
  FW_BIN_DIR="/Library/Frameworks/Python.framework/Versions/${VER}/bin"
  test -d ${FW_BIN_DIR} && test -x ${FW_BIN_DIR}/python${VER} && export PATH="/Library/Frameworks/Python.framework/Versions/3.14/bin:${PATH}"
fi
