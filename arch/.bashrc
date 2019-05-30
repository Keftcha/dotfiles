#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\033[01;36m\][\u@\h \w]\$ \[\033[00m\]'
PS2='\[\033[01;36m\]-> \[\033[00m\]'

# Autostart X at login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
