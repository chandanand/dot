#
# Personal
#

# quick switch to dirs
abbr desk 'cd ~/Desktop'
abbr down 'cd ~/Downloads'
abbr dots 'cd ~/dot'
abbr mono 'cd ~/go-code'
abbr proj 'cd ~/gocode/src/'
abbr code 'cd ~/code'

# quick edits to dot files
abbr aliases 'nvim ~/.config/fish/alias.fish'
abbr funcs 'nvim ~/.config/fish/functions/'
abbr fishconfig 'nvim ~/.config/fish/config.fish'
abbr vimconfig 'nvim ~/.config/nvim/'
abbr tmuxconfig 'nvim ~/.tmux.conf'

#
# System/General
#

abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr cdd 'cd -'

alias ls lsd
alias ranger 'TERM=xterm-256color command ranger'
abbr r ranger
abbr lns 'ln -s'
abbr rmrf 'rm -rf'
abbr mkdirp 'mkdir -p'
abbr cpr 'cp -R'

# archives
abbr tgz 'tar -xvzf' # extract .tar.gz
abbr tbz 'tar -xvjf' # extract .tar.bz2

# system
abbr zzz 'sudo shutdown -s now'
abbr reboot 'sudo shutdown -r now'
abbr off 'sudo shutdown -h now'

#
# Extra
#

# vim
abbr vim 'nvim'
abbr v 'nvim'

# git
abbr g 'git'
abbr gs 'git status'
abbr ga 'git add'
abbr gaa 'git add --all'
abbr gc 'git commit -m'
abbr gc! 'git commit -v --amend'
abbr gcn! 'git commit -v --no-edit --amend'
abbr gco 'git checkout'
abbr gcm 'git checkout master'
abbr gcb 'git checkout -b'
abbr gp 'git push'
abbr gpl 'git pull'
abbr glom 'git pull origin master'
abbr gcl 'git clone'
abbr gb 'git branch'
abbr gbd 'git branch -D'
abbr gl 'git log --oneline --decorate'
abbr glo 'git log --oneline --decorate -5'
abbr grbm 'git rebase master'
abbr grbi 'git rebase -i'
abbr grbc 'git rebase --continue'
abbr grba 'git rebase --abort'

# tmux
abbr ta 'tmux attach -t'
abbr tn 'tmux new-session -s'
abbr tl 'tmux ls'
abbr tk 'tmux kill-session -t'

# arc
abbr adh 'arc diff HEAD~1'
abbr al 'arc land'
abbr alk 'arc land --keep-branch'
abbr ap 'arc patch'
abbr au 'arcupdate'

# brew
abbr bi 'brew install'
abbr get 'brew install'
abbr bud 'brew update'
abbr bug 'brew upgrade'
