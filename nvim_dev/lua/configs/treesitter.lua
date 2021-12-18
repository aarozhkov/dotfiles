require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
        "python",
        "lua",
        "bash",
        "scala",
        "javascript",
        "java",
        "html",
        "typescript",
        "yaml",
        "erlang",
        "dockerfile",
        "go"
    },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
  indent = {
    enable = false,
    disable = {"python"}
  }
}
