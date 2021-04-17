scriptencoding utf-8

if has('autocmd')
  function! s:Autocmds()
    augroup Autocmds
      autocmd!

      autocmd VimResized * execute "normal! \<c-w>="

      " http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
      autocmd VimEnter * autocmd WinEnter * let w:created=1
      autocmd VimEnter * let w:created=1

      " Disable paste mode on leaving insert mode.
      autocmd InsertLeave * set nopaste

      autocmd BufEnter,FocusGained,VimEnter,WinEnter * call chand#autocmds#focus_window()
      autocmd FocusLost,WinLeave * call chand#autocmds#blur_window()

      if has('mksession')
        " Save/restore folds and cursor position.
        autocmd BufWritePost,BufLeave,WinLeave ?* if chand#autocmds#should_mkview() | call chand#autocmds#mkview() | endif
        if has('folding')
          autocmd BufWinEnter ?* if chand#autocmds#should_mkview() | silent! loadview | execute 'silent! ' . line('.') . 'foldopen!' | endif
        else
          autocmd BufWinEnter ?* if chand#autocmds#should_mkview() | silent! loadview | endif
        endif
      elseif has('folding')
        " Like the autocmd described in `:h last-position-jump` but we add `:foldopen!`.
        autocmd BufWinEnter * if line("'\"") > 1 && line("'\"") <= line('$') | execute "normal! g`\"" | execute 'silent! ' . line("'\"") . 'foldopen!' | endif
      else
        autocmd BufWinEnter * if line("'\"") > 1 && line("'\"") <= line('$') | execute "normal! g`\"" | endif
      endif

    augroup END
  endfunction

  call s:Autocmds()
endif
