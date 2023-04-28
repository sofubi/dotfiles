# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.npm-global/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"

# GO
export GOPATH=$HOME/go
export GOROOT="$(where go)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
