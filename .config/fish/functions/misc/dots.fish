function dots -d "List dotfiles with FZF"
  yadm list --files -a | fzf --preview 'bat $HOME/{-1}' --bind 'enter:become(nvim)'
end
