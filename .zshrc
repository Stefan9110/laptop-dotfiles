# Set oh-my-zsh env
export ZSH="$XDG_CONFIG_HOME/zsh/oh-my-zsh" 

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
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*:*:*:*:*' menu select #cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # cache-path $XDG_CACHE_HOME/zsh/zcompcache # case insensitive tab completion

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

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

export GVIMINIT='let $MYGVIMRC="$XDG_CONFIG_HOME/vim/gvimrc" | source $MYGVIMRC'
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# Syntax highlighting
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp cursor)

# Aliases
if [ -f $XDG_CONFIG_HOME/zsh/.zsh_aliases ]; then
	. $XDG_CONFIG_HOME/zsh/.zsh_aliases
fi

# History
HISTFILE="$XDG_STATE_HOME"/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=2000

# flex
neofetch
