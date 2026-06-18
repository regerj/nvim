--------------------------------------------------------------------------------
--- global keybinds
--------------------------------------------------------------------------------

-- focus switching
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })

-- auto-parentheses
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "\"", "\"\"<left>")
vim.keymap.set("i", "'", "''<left>")

-- move up and move down visual lines
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

--------------------------------------------------------------------------------
--- nvim-tree
--------------------------------------------------------------------------------
local tree_api = require("nvim-tree.api")
vim.keymap.set("n", "<C-n>", tree_api.tree.toggle)

--------------------------------------------------------------------------------
--- telescope
--------------------------------------------------------------------------------
local tele_api = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tele_api.find_files)
vim.keymap.set("n", "<leader>fw", tele_api.live_grep)
vim.keymap.set("n", "<leader>fb", tele_api.buffers)
vim.keymap.set("n", "<leader>th", tele_api.colorscheme)

--------------------------------------------------------------------------------
--- lsp
--------------------------------------------------------------------------------
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>lf", vim.diagnostic.open_float)

--------------------------------------------------------------------------------
--- terminal
--------------------------------------------------------------------------------
-- <D> matches MAC command key
-- cannot hide terminal yet...
vim.keymap.set("n", "<D-i>", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<A-i>", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("i", "<D-i>", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("i", "<A-i>", "<cmd>ToggleTerm direction=float<CR>")
