if ! type "fish" > /dev/null; then
  brew install fish
  echo /usr/local/bin/fish | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/fish
fi
