# load user confs
source $HOME/.config/fish/env.fish
source $HOME/.config/fish/uber.fish

set -x YVM_DIR /usr/local/opt/yvm
[ -r $YVM_DIR/yvm.fish ]; and source $YVM_DIR/yvm.fish

if status is-interactive
  # Init Starship
  starship init fish | source

  # Hook direnv
  direnv hook fish | source

  # Setup rbenv
  source (rbenv init -| psub)
end
