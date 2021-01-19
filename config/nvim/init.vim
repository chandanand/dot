let mapleader="\<Space>"
let maplocalleader=","

let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
if filereadable('/Users/canand/dot/nvim_py/bin/python')
  " Avoid search, speeding up start-up.
  let g:python3_host_prog='/Users/canand/dot/nvim_py/bin/python'
endif
if filereadable("/usr/local/bin/neovim-node-host")
  let g:node_host_prog='/usr/local/bin/neovim-node-host'
endif
if filereadable("/Users/canand/.rbenv/shims/neovim-ruby-host")
  let g:node_host_prog='/Users/canand/.rbenv/shims/neovim-ruby-host'
endif

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  " theme
  Plug 'chriskempson/base16-vim'
  Plug 'itchyny/lightline.vim'

  " Navigation
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-dirvish'

  " IDE like
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ludovicchabant/vim-gutentags'
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Improvements
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'wincent/ferret'
  Plug 'wincent/loupe'
call plug#end()

" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
filetype plugin indent on
syntax on

" lightline configuration
let g:lightline = {
  \ 'colorscheme': 'Tomorrow_Night',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'tags', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'filename': 'LightlineFilename',
  \   'cocstatus': 'coc#status',
  \   'tags': 'gutentags#statusline',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
  \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

