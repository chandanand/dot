let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_def_mapping_enabled = 0
let g:go_fmt_command = 'goimports'
let g:go_fmt_experimental = 1
let g:go_term_mode = "split"
let g:go_term_enabled = 1
let g:go_alternate_mode = "vsplit"
let g:go_diagnostics_enabled = 1
let g:go_addtags_transform = "snakecase"
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 0
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0

let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }
