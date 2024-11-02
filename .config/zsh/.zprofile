# vim: set ft=zsh:

if [[ -f ~/.profile ]]; then
  function {
  emulate -L sh
  source ~/.profile
}
fi
