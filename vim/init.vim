let mapleader="\<Space>"
let maplocalleader=","

let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
if filereadable('/Users/canand/dotfiles/vim/nvim_py/bin/python')
  " Avoid search, speeding up start-up.
  let g:python3_host_prog='/Users/canand/dotfiles/vim/nvim_py/bin/python'
endif
if filereadable("/Users/canand/.nvm/versions/node/v13.14.0/bin/neovim-node-host")
  let g:node_host_prog='/Users/canand/.nvm/versions/node/v13.14.0/bin/neovim-node-host'
endif

" lightline configuration
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'filetype' ] ]
  \ },
  \ }

if &loadplugins
  packadd! fzf
  packadd! fzf.vim
  packadd! base16-vim
  packadd! lightline
endif

" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
"
" Must come *after* the `:packadd!` calls above otherwise the contents of
" package "ftdetect" directories won't be evaluated.
filetype plugin indent on
syntax on
