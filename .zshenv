# Default apps
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

# Cleaning up home folder
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GOPATH="${XDG_DATA_HOME}/go"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}/java"
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export PARALLEL_HOME="${XDG_CONFIG_HOME}/parallel"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export SQLITE_HISTORY="${XDG_DATA_HOME}/sqlite_history"
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
export WORKON_HOME="${XDG_DATA_HOME}/virtualenvs"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

# Colored GCC warnings and errors
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

# Add these directories to PATH on shell startup
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$CARGO_HOME/bin
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:/usr/local/go/bin

typeset -U PATH

# Set UTF-8 as default encoding
export LC_ALL=en_US.UTF-8
