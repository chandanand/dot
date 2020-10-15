lua require'chand.lsp'.init()

augroup ChandLanguageClientAutocmds
  autocmd!
  autocmd ColorScheme * lua require'chand.lsp'.set_up_highlights()
  autocmd WinEnter * lua require'chand.lsp'.bind()
augroup END
