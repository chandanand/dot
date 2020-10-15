" Leader mappings.

" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader> <C-^>

nnoremap <Leader>o :only<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>
nnoremap <Leader>q :quit<CR>

" <LocalLeader>s -- Fix (most) syntax highlighting problems in current buffer
" (mnemonic: syntax).
nnoremap <silent> <LocalLeader>s :syntax sync fromstart<CR>

" <LocalLeader>d... -- Diff mode bindings:
" - <LocalLeader>dd: show diff view (mnemonic: [d]iff)
" - <LocalLeader>dh: choose hunk from left (mnemonic: [h] = left)
" - <LocalLeader>dl: choose hunk from right (mnemonic: [l] = right)
nnoremap <silent> <LocalLeader>dd :Gvdiffsplit!<CR>
nnoremap <silent> <LocalLeader>dh :diffget //2<CR>
nnoremap <silent> <LocalLeader>dl :diffget //3<CR>
