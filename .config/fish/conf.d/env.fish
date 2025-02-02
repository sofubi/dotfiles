# Colorize man pages.
set -q LESS_TERMCAP_mb; or set -Ux LESS_TERMCAP_mb (set_color -o blue)
set -q LESS_TERMCAP_md; or set -Ux LESS_TERMCAP_md (set_color -o cyan)
set -q LESS_TERMCAP_me; or set -Ux LESS_TERMCAP_me (set_color normal)
set -q LESS_TERMCAP_so; or set -Ux LESS_TERMCAP_so (set_color -b white black)
set -q LESS_TERMCAP_se; or set -Ux LESS_TERMCAP_se (set_color normal)
set -q LESS_TERMCAP_us; or set -Ux LESS_TERMCAP_us (set_color -u magenta)
set -q LESS_TERMCAP_ue; or set -Ux LESS_TERMCAP_ue (set_color normal)

# Set editor variables.
set -q PAGER; or set -Ux PAGER bat
set -q VISUAL; or set -Ux VISUAL nvim
set -q EDITOR; or set -Ux EDITOR nvim

switch (uname -s)
case Darwin
    set -q BROWSER; or set -Ux BROWSER open
end

# Apps / Tools
set -q SSH_AUTH_SOCK; or set -Ux SSH_AUTH_SOCK $HOME/.1password/agent.sock
set -q PYENV_ROOT; or set -Ux PYENV_ROOT $HOME/.pyenv
set -q FZF_DEFAULT_OPTS; or set -Ux FZF_DEFAULT_OPTS --multi
set -q IPYTHONDIR; or set -Ux IPYTHONDIR $HOME/.config/ipython
