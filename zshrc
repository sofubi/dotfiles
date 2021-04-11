zstyle ':znap:*' plugins-dir ~/.config/zsh
source ~/.config/zsh/zsh-snap/znap.zsh

# Prompt
znap prompt sindresorhus/pure

# Plugins
znap source ohmyzsh/ohmyzsh plugins/{git,virtualenvwrapper}
znap source sorin-ionescu/prezto modules/{environment,history}
export ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

# asdf
znap source asdf-vm/asdf asdf.sh

# nvm
znap source nvm-sh/nvm nvm.sh

# GO
export GOPATH=$HOME/go

# pyenv
export PATH="/home/sofubi/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Clone some stuff
znap clone \
    asdf-community/asdf-direnv

# Up / Down history
znap source zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# path
export -U path=(
    ~/go/bin
    ~/.poetry/bin
    ~/.cargo/env
    ~/.local/bin
    $path
    .
)

# fpath
export -U fpath=(
    ~[asdf]/completions
    $fpath
)

# History in cache
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Load aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.poetry/bin:$PATH"
