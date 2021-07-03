local fn = vim.fn
local execute = vim.api.nvim_command

-- Set leader key to space
vim.api.nvim_set_keymap('n', ' ', '<NOP>',
		    {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Import everything
require('keymappings')
require('plugins')
