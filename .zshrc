# Tdback's zshrc

export LESSHISTFILE="-"
HISTCONTROL=ignoreboth
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# enable cd with just pathnames
setopt autocd

# emacs mode
bindkey -e

# enable noclobber to prevent overwriting existing files with redirection
set -o noclobber

# Enable color support of las and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Don't need this when using autocomplete plugin.
# zstyle :compinstall filename '/home/td/.zshrc'
# autoload -Uz compinit
# compinit

#  Source plugins ( using . )

#  Syntax highlighting 
[ -d ~/.config/zsh/zsh-syntax-highlighting ] && . ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
[ -d ~/.config/zsh/zsh-autocomplete ] && . ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Autosuggestions tab cycle
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# history substring
[ -d ~/.config/zsh/zsh-history-substring-search ] && . ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Source aliases file
[ -f ~/.zsh_aliases ] && . ~/.zsh_aliases

# Source functions file
[ -f ~/.zsh_functions ] && . ~/.zsh_functions

# Enable starship prompt
eval "$(starship init zsh)"

# asdf tool for managing different versions of Lua-Language-Server, etc.
. /opt/asdf-vm/asdf.sh

# opam configuration
[[ ! -r /home/td/.opam/opam-init/init.zsh ]] || source /home/td/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Welcome message
echo "( .-.)"

