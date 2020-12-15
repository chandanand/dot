# custom greeting
function fish_greeting
  if type -q fortune; and type -q cowsay;
    fortune | cowsay
  else
    # enjoy the silence
  end
end

# load user confs
source $HOME/.config/fish/env.fish
source $HOME/.config/fish/alias.fish
source $HOME/.config/fish/uber.fish

# Use vi key bindings
set -g fish_key_bindings fish_vi_key_bindings
# and now restore ctrl+f for autocomplete
# https://github.com/fish-shell/fish-shell/issues/3541
function fish_user_key_bindings
  for mode in insert default visual
    bind -M $mode \ce forward-char
    bind -M $mode \cf forward-word
    bind -M $mode \cg 'commandline -f accept-autosuggestion execute'
  end
end

# Setup jump
status --is-interactive; and source (jump shell fish | psub)

# Setup rbenv
status --is-interactive; and source (rbenv init -| psub)

# Install Starship
starship init fish | source

# enable FZF
fzf_key_bindings

set -x YVM_DIR /usr/local/opt/yvm
[ -r $YVM_DIR/yvm.fish ]; and source $YVM_DIR/yvm.fish
