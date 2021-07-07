-- require("which-key").setup { }

local wk = require("which-key")

wk.register({
  [" "] = { ":Telescope find_files<CR>", "Find file in project" },
  ["/"] = { ":Telescope live_grep<CR>", "Search project" },
  ["*"] = { ":Telescope grep_string<CR>", "Search for symbol in project" },
  s = { function() require("status-window").show() end, "Show status window" },
  b = {
    name = "+Buffer",
    b = { ":Telescope buffers<CR>", "Switch buffer" },
  },
  c = {
    name = "+Code",
    a = { ":Lspsaga code_action<CR>", "Code Action" }
  },
  o = {
    name = "+Open",
    p = { ":NvimTreeToggle<CR>", "Find file in project tree" },
  }
}, { prefix = "<leader>", mode = "n" })

wk.register({
  c = {
    name = "+Code",
    a = { ":<C-U>Lspsaga range_code_action<CR>", "Code Action" }
  }
}, { prefix = "<leader>", mode = "v" })

