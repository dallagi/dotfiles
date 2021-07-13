-- require("which-key").setup { }

local wk = require("which-key")

-- leader
wk.register({
  [" "] = { ":Telescope find_files<CR>", "Find file in project" },
  ["/"] = { ":Telescope live_grep<CR>", "Search project" },
  ["*"] = { ":Telescope grep_string<CR>", "Search for symbol in project" },
  s = { function() require("status-window").show() end, "Show status window" },
  b = {
    name = "+Buffer",
    b = { ":Telescope buffers<CR>", "Switch buffer" },
    d = { ":bd<CR>", "Delete buffer" },
    n = { ":bn<CR>", "Next buffer" },
    p = { ":bp<CR>", "Previous buffer" },
  },
  c = {
    name = "+Code",
    ["/"] = { ":Lspsaga lsp_finder<CR>", "Find" },
    a = { ":Lspsaga code_action<CR>", "Code action" },
    d = { function() vim.lsp.buf.definition() end, "Go to definition" },
    f = { function() vim.lsp.buf.formatting() end, "Format code" },
    i = { function() vim.lsp.buf.implementation() end, "Go to implementation" },
    s = { ":Lspsaga signature_help<CR>", "Signature help" },
    r = { ":Lspsaga rename<CR>", "Rename" },
    t = { function() vim.lsp.buf.type_definition() end, "Go to type definition" },

    D = { ":Lspsaga preview_definition<CR>", "Preview definition" },
  },
  d = {
    name = "+Diagnostics",
    c = { ":Lspsaga show_cursor_diagnostics<CR>", "Show cursor diagnostics" },
    l = { ":Lspsaga show_line_diagnostics<CR>", "Show line diagnostics" },
    n = { function() require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev() end, "Jump to previous diagnostic" },
    p = { function() require'lspsaga.diagnostic'.lsp_jump_diagnostic_next() end, "Jump to next diagnostic" },
  },
  o = {
    name = "+Open",
    p = { ":NvimTreeToggle<CR>", "Find file in project tree" },
  }
}, { prefix = "<leader>", mode = "n" })

wk.register({
  c = {
    name = "+Code",
    a = { ":<C-U>Lspsaga range_code_action<CR>", "Code action" }
  }
}, { prefix = "<leader>", mode = "v" })

