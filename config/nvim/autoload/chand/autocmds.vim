function! chand#autocmds#blur_window() abort
  ownsyntax off
  set nolist
  if has('conceal')
    set conceallevel=0
  endif
endfunction

function! chand#autocmds#focus_window() abort
  if !empty(&ft)
    ownsyntax on
    set list
    if has('conceal')
      set conceallevel=1
    endif
  endif
endfunction
