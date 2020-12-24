[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME=$HOME/.config
[ -z "$XDG_CACHE_HOME" ] && export XDG_CACHE_HOME=$HOME/.cache
[ -z "$XDG_DATA_HOME" ] && export XDG_DATA_HOME=$HOME/.local/share

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export VIMDOTDIR=$XDG_CONFIG_HOME/vim 
export VIMRC=$VIMDOTDIR/vimrc
export VIMINIT="source $VIMRC"
export VIMINFO="source $VIMDOTDIR/viminfo"
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer

# NPM CONFIGURATIONS
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# JUPYTER CONFIGURATIONS
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

alias='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts'

export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export FONT="Source Code Pro Semibold"

export PATH=$HOME/Repos/Pico/pico-8:$PATH
