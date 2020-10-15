" Normal mode mappings.

" Relying on Karabiner-Elements to avoid collision between <Tab> and
" <C-i> (have it send F6 instead for <C-i>).
nnoremap <F6> <C-i>

" Multi-mode mappings (Normal, Visual, Operating-pending modes).
noremap Y y$

" Repurpose cursor keys (accessible near homerow via "SpaceFN" layout) for one
" of my most oft-use key sequences.
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

nnoremap <silent> <S-Up> :lprevious<CR>
nnoremap <silent> <S-Down> :lnext<CR>
nnoremap <silent> <S-Left> :lpfile<CR>
nnoremap <silent> <S-Right> :lnfile<CR>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" Close pane using c-w
noremap <silent> <C-w> :bd<Cr>

" More sane vertical navigation - respects columns
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

nnoremap <c-p> :bprevious<cr>
nnoremap <c-n> :bnext<cr>
nnoremap <f7> :tabprevious<cr>
nnoremap <f8> :tabnext<cr>

" Change text without putting the text into register,
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" Make s/S/ss behave like d/D/dd without saving to register
nnoremap s  "_d
nnoremap S  "_D
nnoremap ss "_dd

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" use tab and shift tab to indent and de-indent code
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Moves selected Lines up and Down with alt-j/k
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
