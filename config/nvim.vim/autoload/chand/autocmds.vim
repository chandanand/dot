let g:ChandMkviewFiletypeBlacklist = ['diff', 'hgcommit', 'gitcommit']

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

" Loosely based on: http://vim.wikia.com/wiki/Make_views_automatic
function! chand#autocmds#should_mkview() abort
  return
        \ &buftype ==# '' &&
        \ index(g:ChandMkviewFiletypeBlacklist, &filetype) == -1 &&
        \ !exists('$SUDO_USER') " Don't create root-owned files.
endfunction

function! chand#autocmds#mkview() abort
  try
    if exists('*haslocaldir') && haslocaldir()
      " We never want to save an :lcd command, so hack around it...
      cd -
      mkview
      lcd -
    else
      mkview
    endif
  catch /\<E186\>/
    " No previous directory: probably a `git` operation.
  catch /\<E190\>/
    " Could be name or path length exceeding NAME_MAX or PATH_MAX.
  endtry
endfunction
