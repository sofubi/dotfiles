function pva -d "Activate local or pyenv venv using FZF"
  argparse l/local -- $argv
  or return

  if set -ql _flag_local
    if test -e venvs
      set -l venv_dir venvs
    else if test -e .venvs
      set -l venv_dir venvs
    else
      echo "No venv dirs found"
      return 1
    end
    source "$(fd . -t d $venv_dir | fzf 2>/dev/null)/bin/activate"
  else
    pyenv activate (pyenv virtualenvs --bare | fzf 2>/dev/null)
  end
end
