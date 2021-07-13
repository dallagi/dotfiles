-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Do not copy replaced text when pasting
vim.cmd('vnoremap p "0p')
vim.cmd('vnoremap P "0P')

-- Clear highlight of last search results
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR>', {noremap = true, silent = true})

-- TODO move to lspsaga config
vim.api.nvim_set_keymap('n', 'K', ":Lspsaga hover_doc<CR>", {noremap = true, silent = true})

-- scroll down hover doc
vim.api.nvim_set_keymap('n', '<C-j>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {noremap = true, silent = true})
-- scroll up hover doc
vim.api.nvim_set_keymap('n', '<C-k>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {noremap = true, silent = true})

