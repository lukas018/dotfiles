export TERMINAL='alacritty'
export EDITOR='emacsclient'

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$XDG_DATA_HOME/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$XDG_DATA_HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$XDG_DATA_HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$XDG_DATA_HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="/home/lukas/.local/bin/scripts:$PATH"
export PATH="$XDG_DATA_HOME/miniconda3/bin:$PATH"
export PATH="$HOME/.local/bin/statusbar:$PATH"
setxkbmap -option caps:ctrl_modifier
# .local/bin/wal -R
# launch-polybar

export PATH="$HOME/.cargo/bin:$PATH"

# include Mycroft commands
source ~/.profile_mycroft

setxkbmap -option caps:ctrl_modifier
setxkbmap -model pc104 -layout us,se -variant ,, -option grp:alt_shift_toggle
