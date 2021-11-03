local npairs = require("nvim-autopairs")
npairs.setup()
require("nvim-autopairs.completion.compe").setup(
    {
        map_cr = true, --  map <CR> on insert mode
        map_complete = true -- it will auto insert `(` after select function or method item
    }
)

local endwise = require("nvim-autopairs.ts-rule").endwise
-- autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))

npairs.add_rules(
    {
        endwise(" do$", "end", "elixir", nil)
    }
)

