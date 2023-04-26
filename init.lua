local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local diagnostic = vim.diagnostic

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- colorcolumn
-- opt.colorcolumn = "120"

-- This utilizes the vim.t.bufs tab table variable where we store buffer numbers of current tab.
-- Then it loops from 1-9 to create mappings of switching tab by number i.e Alt+1 will switch first tab.
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

