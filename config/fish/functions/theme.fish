function theme --description "Change terminal theme based on os theme"
  set -l theme $argv
  if test $theme = "dark"
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
    sed -i .bak -e 's/^colors: *.*/colors: *dark/g' ~/.config/alacritty/alacritty.yml
    sed -i .bak -e 's/^set background=.*/set background=dark/g' ~/.config/nvim/after/plugin/colors.vim
    sed -i .bak -e 's/^colorscheme .*/colorscheme base16-tomorrow-night/g' ~/.config/nvim/after/plugin/colors.vim
    sed -i .bak -e "s/'colorscheme': .*/'colorscheme': 'Tomorrow_Night',/g" ~/.config/nvim/init.vim
  else
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false'
    sed -i .bak -e 's/^colors: *.*/colors: *light/g' ~/.config/alacritty/alacritty.yml
    sed -i .bak -e 's/^set background=.*/set background=light/g' ~/.config/nvim/after/plugin/colors.vim
    sed -i .bak -e 's/^colorscheme .*/colorscheme base16-tomorrow/g' ~/.config/nvim/after/plugin/colors.vim
    sed -i .bak -e "s/'colorscheme': .*/'colorscheme': 'Tomorrow',/g" ~/.config/nvim/init.vim
  end
end
