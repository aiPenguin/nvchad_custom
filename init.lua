local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

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

-- Spell check
opt.spell = true

-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    opt.foldmethod     = 'expr'
    opt.foldexpr       = 'nvim_treesitter#foldexpr()'
    opt.foldlevelstart = 99
  end
})
---ENDWORKAROUND
