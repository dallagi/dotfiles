local fn = vim.fn

-- Set leader key to space
vim.api.nvim_set_keymap('n', ' ', '<NOP>',
		    {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.opt.timeoutlen = 300

-- Import everything
require('plugins')
require('keymappings')
