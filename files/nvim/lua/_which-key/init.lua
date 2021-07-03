-- require("which-key").setup { }

local wk = require("which-key")

wk.register({
  [" "] = { ":Telescope find_files<CR>", "Find file in project" },
  ["/"] = { ":Telescope live_grep<CR>", "Search project" },
  ["*"] = { ":Telescope grep_string<CR>", "Search for symbol in project" },
  b = {
    name = "+Buffer",
    b = { ":Telescope buffers<CR>", "Switch buffer" },
  },
  o = {
    name = "+Open",
    p = { ":NvimTreeToggle<CR>", "Find file in project tree" },
  }
}, { prefix = "<leader>" })

