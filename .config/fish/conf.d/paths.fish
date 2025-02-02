set GNUBIN '/opt/homebrew/opt/grep/libexec/gnubin'

fish_add_path --prepend (
    path filter $PYENV_ROOT/bin $HOME/.cargo/bin $GNUBIN
)
