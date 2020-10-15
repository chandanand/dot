setlocal shiftwidth=2
setlocal tabstop=2

function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

nmap <localleader>b :<C-u>call <SID>build_go_files()<CR>
nmap <localleader>rn <Plug>(go-run)
nmap <localleader>tt <Plug>(go-test)
nmap <localleader>cc <Plug>(go-coverage-toggle)
nmap <localleader>i <Plug>(go-info)
command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
setlocal foldmethod=syntax foldlevel=99
