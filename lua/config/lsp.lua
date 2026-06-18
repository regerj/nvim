vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("json-lsp")

-- LSP Busy Dot Configuration --
--
-- There is a lsp_busy map that maps buffers to booleans representing
-- if the lsp is currently busy. There is an autocommand on LspProgress
-- that checks if an end event has occurred, and will modify the entry
-- based on it. LspDetach, BufWipeout erases. Set statusline to call
-- MyLspStatus() function for far right corner, set as coloured dot
-- depending on busy or not.

-- Per-buffer LSP progress state
local lsp_busy = {}

vim.api.nvim_create_augroup('my.lsp.status', { clear = true })

vim.api.nvim_create_autocmd('LspProgress', {
  group = 'my.lsp.status',
  callback = function(ev)
    local value = ev.data.params.value
    if not value or not value.kind then return end

    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- LspProgress is not buffer-scoped, so apply to every buffer the
    -- client is attached to.
    for buf in pairs(client and client.attached_buffers or {}) do
      if value.kind == 'end' then
        lsp_busy[buf] = false
      else
        lsp_busy[buf] = true
      end
    end
    vim.cmd('redrawstatus')
  end,
})

vim.api.nvim_create_autocmd('LspDetach', {
  group = 'my.lsp.status',
  callback = function(ev) lsp_busy[ev.buf] = nil end,
})

vim.api.nvim_create_autocmd('BufWipeout', {
  group = 'my.lsp.status',
  callback = function(ev) lsp_busy[ev.buf] = nil end,
})

-- Define the dot colors. Re-applied on colorscheme changes so they survive
-- :colorscheme.
local function set_lsp_hl()
  vim.api.nvim_set_hl(0, 'MyLspDotBusy', { link = 'DiagnosticWarn' })
  vim.api.nvim_set_hl(0, 'MyLspDotDone', { link = 'DiagnosticInfo' })
end
set_lsp_hl()
vim.api.nvim_create_autocmd('ColorScheme', {
  group = 'my.lsp.status',
  callback = set_lsp_hl,
})

local DOT = '●' -- or '•', 'o', etc.

function _G.MyLspStatus()
  local buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = buf })
  if #clients == 0 then return '' end

  if lsp_busy[buf] then
    -- In progress: yellow dot
    return string.format('%%#MyLspDotBusy#%s%%* ', DOT)
  end

  -- No active progress: green dot
  return string.format('%%#MyLspDotDone#%s%%* ', DOT)
end

vim.o.statusline = vim.o.statusline .. ' %{%v:lua.MyLspStatus()%}'
