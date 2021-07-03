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

  use { 'joshdick/onedark.vim' }

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = [[require('_telescope')]],
      cmd = "Telescope"
  }

  -- use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},

  use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function() require("_nvimtree").config() end
  }
end)
