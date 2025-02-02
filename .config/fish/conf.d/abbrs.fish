set -q MY_ABBRS_INITIALIZED; and return

# lsd
abbr -a -- ls lsd
abbr -a -- lt 'lsd --tree'
abbr -a -- tree 'lsd --tree'
abbr -a -- l 'lsd -F'
abbr -a -- ll 'lsd -lh'
abbr -a -- la 'lsd -lah'
abbr -a -- ldot 'lsd -ld .*'

# with opts
abbr -a -- d 'dirs -v'

# nvim
abbr -a -- v nvim
abbr -a -- vi nvim
abbr -a -- vim nvim

# helpers
abbr -a -- portfd "lsof -iTCP -sTCP:LISTEN -P -n | grep -i"

# python
abbr -a -- pvd 'pyenv deactivate'

set -g MY_ABBRS_INITIALIZED true
