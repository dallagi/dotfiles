local fn = vim.fn

-- Import everything
require('plugins')
require('keymappings')

-- Set leader key to space
vim.api.nvim_set_keymap('n', ' ', '<NOP>',
		    {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Config without home yet
vim.opt.timeoutlen = 300
require('onedark').setup()
