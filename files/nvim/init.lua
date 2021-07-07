local fn = vim.fn

-- Import everything
require('plugins')
require('keymappings')
require('_treesitter')

-- Set leader key to space
vim.api.nvim_set_keymap('n', ' ', '<NOP>',
		    {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Config without home yet
vim.opt.timeoutlen = 300
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.title = true


-- TODO
-- Remove status line and replace with floating window with all info such as branch, filename, type etc.
-- Replace colorscheme with one that supports treesitter (eg. https://github.com/NTBBloodbath/doom-one.nvim or https://github.com/ChristianChiarulli/nvcode-color-schemes.vim)
