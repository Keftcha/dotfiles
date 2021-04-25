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
# Options for interne zsh and shell
# --------------------------------------------------------------------------
autoload -U colors
colors
unsetopt correctall
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

zmodload zsh/complist    # Load completion list extension
bindkey -M menuselect "^I" menu-complete    # Tab
bindkey -M menuselect "^[[Z" reverse-menu-complete    # Maj + Tab
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# Functions
# --------------------------------------------------------------------------
echo_git_branch() {
    echo "$(command git symbolic-ref --short HEAD 2> /dev/null)"
}
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
alias -g l="| less -r"

# Suffix alias
alias -s go=e    # Go file
alias -s hs=e    # Haskell file
alias -s md=e    # Markdown file
alias -s pdf=evince    # Pdf file
# alias -s py=e    # Python file
# alias -s rb=e    # Ruby file
alias -s rs=e    # Rust file
alias -s toml=e    # TOML file
alias -s zig=e    # Zig file

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
alias gfh="git fetch"
alias gsl="git shortlog -sn"
alias grb="git rebase"
alias gsh="git stash"
alias gblm="git blame"

# Docker
alias dc="docker-compose"
alias dimg="docker image"
alias dctn="docker container"
alias dvlm="docker volume"
alias dsp="docker system prune"
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# Shell variables
# --------------------------------------------------------------------------
if [[ $TERM == 'rxvt-unicode-256color' ]] ;
then
  export TERM=rxvt-unicode
fi

export EDITOR=vim

# prompts variables
define_prompts_variables () {
    export PS1="%{[31;1m%}%T %{[32m%}%n@%{[32m%}%m%{[01;33m%}:%{[34;1m%}%0~%{[0m%}%{[01;33m%}%#%{[0m%} "
    export RPS1="%{[36;1m%}$(echo_git_branch)%{[0m%} %(?.%{[92;1m%}✔%{[0m%}.%{[91;1m%}✘%{[0m%}"
    # export RPROMPT="%{[36;1m%}%~%{[0m%}"
    # export PS2="%{[36;1m%}%_ %{[0m%}> "
}
# redefine prompts variables to re-execute the functions in them
precmd_functions+=( define_prompts_variables )

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/lib:/usr/local/lib"

# Go variables
export GOPATH="$HOME/prg/go"
export GOROOT="/usr/lib/go"

# PATH
export PATH="$PATH:$GOROOT/bin"    # Go executable
export PATH="$PATH:$GOPATH/bin"    # Go binaries
export PATH="$PATH:$HOME/.cargo/bin"    # Rust tools
export PATH="$PATH:$HOME/bin"    # Binaries files in home folder
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

# --------------------------------------------------------------------------
# Start X server at login when in tty1 (compatible with Arch and Gentoo)
# --------------------------------------------------------------------------
if [[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 || $(tty) == /dev/tty1 ]]; then
    exec startx
fi
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# Other
# --------------------------------------------------------------------------
