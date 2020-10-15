local lsp = {}

local nnoremap = function (lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, {noremap = true, silent = true})
end

local on_attach = function ()
  local mappings = {
    ['<Leader>ld'] = '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>',
    ['<c-]>'] = '<cmd>lua vim.lsp.buf.definition()<CR>',
    ['K'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
    ['gd'] = '<cmd>lua vim.lsp.buf.declaration()<CR>',
  }

  for lhs, rhs in pairs(mappings) do
    nnoremap(lhs, rhs)
  end

  vim.api.nvim_win_set_option(0, 'signcolumn', 'yes')
end

lsp.bind = function ()
  pcall(function ()
    if vim.api.nvim_win_get_var(0, 'textDocument/hover') then
      nnoremap('K', ':call nvim_win_close(0, v:true)<CR>')
      nnoremap('<Esc>', ':call nvim_win_close(0, v:true)<CR>')

      vim.api.nvim_win_set_option(0, 'cursorline', false)

      -- I believe this is supposed to happen automatically because I can see
      -- this in lsp/util.lua:
      --
      --     api.nvim_buf_set_option(floating_bufnr, 'modifiable', false)
      --
      -- but it doesn't seem to be working.
      vim.api.nvim_buf_set_option(0, 'modifiable', false)
    end
  end)
end

lsp.init = function ()

  require'nvim_lsp'.gopls.setup{
    cmd = {"gopls", "serve"},
    on_attach = on_attach,
  }

  require'nvim_lsp'.vimls.setup{
    on_attach = on_attach,
  }

end

return lsp
