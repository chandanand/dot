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
    augroup END
  endfunction

  call s:Autocmds()
endif
