local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Configure plugins
return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  use { 'navarasu/onedark.nvim' }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require("_gitsigns").config() end
  }

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = [[require('_telescope')]],
      cmd = "Telescope"
  }

  -- use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = [[require('_lualine')]]
  }

  use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function() require("_nvimtree").config() end
  }

  use {
    "folke/which-key.nvim",
    config = [[require('_which-key')]]
  }
end)
