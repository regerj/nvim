local setup = function ()
    require("nvim-treesitter.config").setup {
        ensure_installed = { "lua", "vim", "rust", "c", "cpp", "python", "toml", "json" },
        highlight = {
            enable = true,
        }
    }
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = setup,
}
