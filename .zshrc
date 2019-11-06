# The following lines were added by compinstall
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors "di=01;34:ma=103;30"
zstyle ':completion:*' max-errors 0
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

# --------------------------------------------------------------------------
# Options zsh interne et shell
# --------------------------------------------------------------------------
autoload -U colors
colors
setopt correctall
setopt hist_ignore_all_dups
setopt No_Beep
setopt complete_in_word
setopt pushd_ignore_dups
setopt append_history
setopt hist_ignore_dups
setopt autocd
unsetopt rm_star_silent
unsetopt list_ambiguous
setopt share_history
setopt interactivecomments

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# Alias
# --------------------------------------------------------------------------
alias cls="clear"
alias ls="ls --color"
alias la="ls -lah"
alias ll="ls -lh"
alias grep="grep --color=auto"
alias cp="cp -i"
alias mv="mv -i"
alias e="vim"
alias weechat="weechat-curses"
alias dd="dd status=progress"

# Joke
alias gtfo="poweroff"
alias please="sudo"
# alias clear="echo NO!"

# Global alias
alias -g g="| grep"

# Suffix alias
alias -s c=e
alias -s cc=e
alias -s cpp=e
alias -s h=e
alias -s hpp=e
alias -s hxx=e
alias -s tpp=e
alias -s pdf=evince    # Pdf file
# alias -s py=e    # Python file
alias -s rs=e    # Rust file
alias -s toml=e    # TOML file
# alias -s rb=e    # Ruby file

# Git
alias ga="git add"
alias gcm="git commit"
alias gh="git push"
alias gl="git pull"
alias gs="git status"
alias gb="git branch"
alias gck="git checkout"
alias gdf="git diff"
alias gm="git merge"
alias gcl="git clone"
alias glg="git log --graph"
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# Shell variables
# --------------------------------------------------------------------------
if [[ $TERM == 'rxvt-unicode-256color' ]] ;
then
  export TERM=rxvt-unicode
fi

export EDITOR=vim
export PS1="%{[31;1m%}%T %{[32m%}%n@%{[32m%}%m%{[01;33m%}:%{[34;1m%}%0~%{[0m%}%{[01;33m%}%#%{[0m%} "
# export PS2="%{[36;1m%}%_ %{[0m%}> "
export PS2="%{[0m%}> "
export RPROMPT=""
# export RPROMPT="%{[36;1m%}%~%{[0m%}"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/lib:/usr/local/lib"
export GOPATH="$HOME/prg/go"
export PATH="$PATH:$HOME/bin:/usr/lib/go-1.9/bin:$GOPATH/bin:$HOME/.cargo/bin"
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# Prompt style
# --------------------------------------------------------------------------
# autoload -U promptinit
# promptinit
#
# prompt fire red magenta blue white white white
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# Some custom bindkeys
# --------------------------------------------------------------------------
bindkey "^A" beginning-of-line    # Ctrl + A
bindkey "^E" end-of-line    # Ctrl + E
bindkey "^[[3~" delete-char    # Delete
bindkey "^R" history-incremental-search-backward    # Ctrl + R
bindkey "^[[1;5C" forward-word    # Ctrl + →
bindkey "^[[1;5D" backward-word    # Ctrl + ←
bindkey "^?" backward-delete-char    # Backspace
bindkey "^[[A" history-beginning-search-backward-end    # ↑
bindkey "^[[B" history-beginning-search-forward-end    # ↓
# --------------------------------------------------------------------------
