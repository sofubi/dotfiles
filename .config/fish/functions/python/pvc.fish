function pvc -d "Create a python venv"
  argparse 'p/pyenv' 'name=?' -- $argv
  or return
  if set -ql _flag_pyenv
    if not set -ql _flag_name
      pyenv virtualenv --upgrade-deps (basename $PWD)
    else
      pyenv virtualenv --upgrade-deps $_flag_name
    end
  else
    python -m venv --upgrade-deps .venv
  end
end
