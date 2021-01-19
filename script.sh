brew install neovim font-fira-code-nerd-font lsd rbenv fzf rg fortune cowsay

rbenv install 2.7.2
rbenv global 2.7.2
gem install neovim

cd ~/dot
pip uninstall virtualenv
pip3 install virtualenv
virtualenv nvim_py -p (which python3)
source ./nvim_py/bin/activate.fish
pip install neovim

git clone git@github.com:chandanand/ergodox-layout
brew install qmk/qmk/qmk
qmk setup

tic -x terminfo/tmux-256color.info
