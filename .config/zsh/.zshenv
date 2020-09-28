# XDG defaults
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Zsh dotfile dir
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/zsh_history

# Xinitrc location
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

# Disable lesshst
export LESSHISTFILE=-

# Node REPL histfile
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# NPM config
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# Wget
export WGETRC="$XDG_CONFIG_HOME"/wget/config

# GTK 2
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtk

# Doom emacs
export PATH=$PATH:$HOME/.emacs.d/bin

# pip scripts
export PATH=$PATH:$HOME/.local/bin
