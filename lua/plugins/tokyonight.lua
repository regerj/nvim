local function setup()
    require("tokyonight").setup({
        on_colors = function (colors)
            -- this makes it so the floating windows look seamless
            colors.bg_float = colors.bg
        end
    })
end

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = setup,
}
