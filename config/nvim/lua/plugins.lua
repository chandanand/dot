local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- LSP
  use "neovim/nvim-lspconfig"
  use "glepnir/lspsaga.nvim"
  use "onsails/lspkind-nvim"
  use {"kabouzeid/nvim-lspinstall", opt = true}

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"

  -- Autocomplete
  use "hrsh7th/nvim-compe"
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"

  use {'kevinhwang91/nvim-bqf', opt = true}
  use 'glepnir/dashboard-nvim'
  use 'lewis6991/gitsigns.nvim'
  use {'liuchengxu/vim-which-key', opt = true}
  use 'windwp/nvim-autopairs'
  use 'terrortylor/nvim-comment'

  -- Color
  use "rakr/vim-one"

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- Status Line and Bufferline
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use "romgrk/barbar.nvim"
end)
