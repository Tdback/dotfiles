# Tdback's zsh config.

autoload -U colors && colors
# Customize my prompt by manipulating the PS1 environment variable
PS1="
%{$fg[blue]%}%~ %{$fg[yellow]%}λ%{$reset_color%} "

set -o noclobber            # enable noclobber to prevent overwriting w/ redirection
setopt autocd               # auto cd into typed directory
setopt interactive_comments # enable comments in commands (similar to bash default)
setopt incappendhistory     # append each command to history `before' it is run

# Set my history file and size
HISTCONTROL=ignoreboth
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey -v '^g' vi-cmd-mode # A bad habit I picked up from using Emacs for eight months

# History searching with arrows in `insert' mode
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zstyle :compinstall filename '/home/td/.zshrc'
autoload -Uz compinit && compinit

# Source aliases file
[ -f ~/.zsh_aliases ] && . ~/.zsh_aliases

# Source syntax highlighting
[ -d ~/.config/zsh/zsh-syntax-highlighting ] && . ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source history substring
[ -d ~/.config/zsh/zsh-history-substring-search ] && . ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

