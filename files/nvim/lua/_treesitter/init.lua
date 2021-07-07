require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {"haskell"},
    matchup = {
        enable = true -- mandatory, false will disable the whole extension
    },
    highlight = {
        enable = true -- false will disable the whole extension
    },
    context_commentstring = {enable = false, config = {css = '// %s'}},
    indent = {enable = {"javascriptreact"}},
    autotag = {enable = true},
}
