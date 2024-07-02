require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "typescript",
        "tsx",            
        "graphql",
        "bash",
        "lua",
        "python"
    },
    highlight = {
        enable = true,              
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,              
    },
}
