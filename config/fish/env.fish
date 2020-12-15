# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# add homebrew to the beginning of PATH
set SYSTEM_PATH $PATH
set -e PATH
set -g -x PATH $GOPATH/bin $PATH
set -g -x PATH $HOME/bin $PATH
set -g -x PATH /usr/local/bin $PATH
set -g -x PATH /usr/local/sbin $PATH
set -g -x PATH $SYSTEM_PATH $PATH
set -g -x PATH $HOME/.local/bin $PATH
set -g -x PATH $HOME/.rbenv/bin $PATH
set -g -x PATH $HOME/.rbenv/shims $PATH

# editor
set -gx EDITOR nvim
set -gx SVN_EDITOR 'nvim +startinsert!'
set -gx GIT_EDITOR 'nvim +startinsert!'

# Colorful man pages
# from http://pastie.org/pastes/206041/text
set -gx LESS_TERMCAP_mb (set_color -o red)
set -gx LESS_TERMCAP_md (set_color -o red)
set -gx LESS_TERMCAP_me (set_color normal)
set -gx LESS_TERMCAP_se (set_color normal)
set -gx LESS_TERMCAP_so (set_color -b blue -o yellow)
set -gx LESS_TERMCAP_ue (set_color normal)
set -gx LESS_TERMCAP_us (set_color -o green)

set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore-vcs --hidden'
set -gx FZF_DEFAULT_OPTS '--color=dark'

set -gx GOPATH $HOME/gocode
