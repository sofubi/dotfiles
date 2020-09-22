# set wal colors
if [[ "$(hostname)" == "kyoto" ]]; then
    (cat ~/.cache/wal/sequences &)
fi

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# In# vi mode

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# fzf defaults
export FZF_DEFAULT_COMMAND='rg --files --smart-case --hidden --color auto'

# Set aliases
source $HOME/.config/zsh/.aliases

if [[ "$(hostname)" != "kyoto" ]]; then
    # npm-config-prefix
    export PATH=~/.npm-global/bin:$PATH
    
fi

# composer
export PATH=~/.config/composer/vendor/bin:$PATH

# scripts
export PATH=~/bin:$PATH

# cargo on path
export PATH=~/.cargo/bin:$PATH

# zsh-nvm opts
export NVM_DIR="$HOME/.config/nvm"
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true

if [[ "$(hostname)" == "kyoto" ]] then;
    # manage dots
    export DOTBARE_DIR="$HOME/.dotfiles.git/"
    export DOTBARE_TREE="$HOME"
fi

# Init and bundle antibody
source <(antibody init)
antibody bundle < ~/.config/zsh/plugins.txt

# Spaceship prompt opts
eval spaceship_vi_mode_enable

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
