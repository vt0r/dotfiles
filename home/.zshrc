# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="prosevatore"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colorize debian golang mercurial perl tmux ruby rvm)

source $ZSH/oh-my-zsh.sh

# I HATE CORRECTION!
DISABLE_CORRECTION="true"
unsetopt correct
unsetopt correct_all

# Brace expansion
setopt BRACE_CCL

## Imported from original .bashrc
export TERM="xterm-256color"
export PATH=${PATH}:~/bin
export LANG=en_US.utf8
export LESSCHARSET=utf-8
export PERL_UTF8_LOCALE=1 PERL_UNICODE=AS
alias tmux="tmux -2"

# Tmux
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Dircolors
if [ "$(uname -s)" = "Darwin" ]
then
    eval $(gdircolors ~/dircolors-solarized/dircolors.ansi-dark)
    alias ls="gls --color=auto"
else
    eval $(dircolors ~/dircolors-solarized/dircolors.ansi-dark)
fi

# Password generator
alias pw="gopwgen a"

# Kill the SC daemon
alias sckill="killall -9 scdaemon"
alias killsc="killall -9 scdaemon"

# Sbin
function sbin() {
    cat > /tmp/$$.sbin.me
    curl -sd "$(cat /tmp/$$.sbin.me)" https://sbin.me/documents | awk -F '"' '{print "https://sbin.me/"$4}'
    rm -f $$.sbin.me
}

# Use gpg2 always (even with Homebrew)
alias gpg="gpg2"

# Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Stuff that isn't public and won't be tracked in any repo
# The reason I'm not doing a test for this file is because
# I want to ensure an error is printed if it doesn't exist
source "$HOME/.zsh.nonpublic"

## END

