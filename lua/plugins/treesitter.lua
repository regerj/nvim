local setup = function ()
    vim.cmd.syntax("off")
    vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*",
        callback = function ()
            vim.treesitter.start()
        end,
        once = true,
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = setup,
}
