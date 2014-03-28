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

# I HATE CORRECTION!
DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colorize debian golang mercurial perl tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/salvatore/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin:/home/salvatore/bin

## Imported from original .bashrc
export TERM="xterm-256color"
export PATH=${PATH}:~/bin
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export PERL_UTF8_LOCALE=1 PERL_UNICODE=AS
alias tmux="tmux -2"

# Tmux
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Dircolors
eval `dircolors ~/dircolors-solarized/dircolors.ansi-dark`

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

alias gpg="gpg2"

# Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Stuff that isn't public and won't be tracked in any repo
source "$HOME/.zsh.nonpublic"

## END
