local fn = vim.fn

-- Set leader key to space
vim.api.nvim_set_keymap('n', ' ', '<NOP>',
		    {noremap = true, silent = true})
vim.g.mapleader = ' '

-- require('plenary').reload.reload_module('', true)

-- Import everything
require('plugins')
require('keymappings')
