# load user confs
source $HOME/.config/fish/env.fish
source $HOME/.config/fish/uber.fish

# Init Starship
starship init fish | source

# Hook direnv
direnv hook fish | source

if status is-interactive
  # Setup rbenv
  source (rbenv init -| psub)

  if not set -q TMUX
    tmux new-session -A -s main
  end
end
