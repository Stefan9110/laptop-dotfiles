# Set oh-my-zsh env
export ZSH="$HOME/.oh-my-zsh" 

# oh-my-zsh theme
ZSH_THEME="agnoster"

# oh-my-zsh plugins
plugins=(git vi-mode archlinux zsh-autosuggestions zsh-syntax-highlighting)

# start oh-my-zsh
source $ZSH/oh-my-zsh.sh

# set prefferred editor
export EDITOR='vim'

# autocomplete
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi


# syntax highlighting
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp cursor)

# aliases
alias sudoedit='sudo vim'
alias fm='thunar'
alias editstart='vim ~/.config/startup/start.sh'
alias bsquit='bspc quit'
alias dotfiles='cd ~/Coding/Linux/dotfiles'
alias pdf='llpp'

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

# flex
neofetch
