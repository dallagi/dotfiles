local M = {}

M.config = function()
    vim.g.nvim_tree_side = "left"
    vim.g.nvim_tree_width = "100%"
    vim.g.nvim_tree_quit_on_open = 1
end

return M
