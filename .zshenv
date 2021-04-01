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

<<<<<<< HEAD
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add emacs to our path
export PATH=$HOME/.emacs.d/bin:$PATH

# Use EmacsClient instead of normal emacs
alias emacs="emacsclient -c"
export EDITOR="emacsclient -c"

PATH=$JAVA_HOME/bin:$PATH

# PATH="/home/luklun/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/luklun/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/luklun/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/luklun/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/luklun/perl5"; export PERL_MM_OPT;

# TexLive path
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH

export PATH=/usr/luklun/bin:$PATH
=======
export FONT="Source Code Pro Semibold"

export PATH=$HOME/Repos/Pico/pico-8:$PATH
>>>>>>> 890d56c278f7675c3375a0b4d405e83be2a2f793
