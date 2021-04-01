export TERMINAL='alacritty'
export EDITOR='emacs'

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin/statusbar:$PATH"

setxkbmap -option ctrl:nocaps
setxkbmap -model pc104 -layout us,se -variant ,, -option grp:alt_shift_toggle
$HOME/.fehbg
compton -b
#sleeper&
