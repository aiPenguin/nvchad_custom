---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>s"] = { "<cmd> w <CR>", "save file" },
    ["<leader>m"] = { "<cmd> Telescope todo-comments <CR>", "show TODOs" },
    ["<leader>ng"] = {
      function()
        require("neogen").generate()
      end,
      "generate annotation",
    },
  },
}

M.nvterm = {
  n = {
    -- new
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },
    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}

-- more keybinds!
M.telescope = {
  plugin = true,
  n = {
    -- find
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "find projects" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>hs"] = { function() require("gitsigns").stage_hunk() end, "stage hunk" },
    ["<leader>hr"] = { function() require("gitsigns").reset_hunk() end, "reset hunk" },
    ["<leader>hS"] = { function() require("gitsigns").stage_buffer() end, "stage buffer" },
    ["<leader>hu"] = { function() require("gitsigns").undo_stage_hunk() end, "undo stage hunk" },
    ["<leader>hR"] = { function() require("gitsigns").reset_buffer() end, "reset buffer" },
    ["<leader>hp"] = { function() require("gitsigns").preview_hunk() end, "preview hunk" },
    ["<leader>hb"] = {
      function()
        require("gitsigns").blame_line { full = true }
      end,
      "blame line",
    },
    ["<leader>hd"] = { function() require("gitsigns").diffthis() end, "diffthis" },
    ["<leader>hD"] = { "<cmd> diffoff <CR>", "closs diffview" },
    ["<leader>td"] = {function() require("gitsigns").toggle_deleted() end, "toggle deleted" },
    ["<leader>tb"] = {function() require("gitsigns").toggle_current_line_blame() end, "toggle current line blame" },
  },
  v = {
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "stage hunk",
    },
    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "reset_hunk",
    },
  },
  o = {
    -- Text object
    ["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", "select hunk" },
  },
  x = {
    -- Text object
    ["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", "select hunk" },
  },
}

M.disabled = {
  n = {
    -- nvterm
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    -- gitsings
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
  },
}

return M
