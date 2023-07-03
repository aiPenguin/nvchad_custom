---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>s"] = { "<cmd> w <CR>", "save file" },
    ["<leader>zf"] = { "<cmd> set foldmethod=indent <CR>", "set fold method to indent" },
    ["<leader>nb"] = { "<cmd> enew <CR>", "new buffer" },
    ["<leader>ln"] = { "<cmd> set nu! <CR>", "toggle line number" },
    ["<leader>hD"] = { "<cmd> diffoff <CR>", "closs diffview" },
  },
}

M.nvterm = {
  n = {
    -- new
    ["<leader>ht"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },
    ["<leader>vt"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}

M.tabufline = {
  n = {
    -- close tabpage
    ["<leader>X"] = { " <cmd> tabclose <CR> ", "close tabpage" },
    ["<leader>nt"] = { " <cmd> tabnew <CR> ", "new tabpage" },
  },
}

M.telescope = {
  n = {
    -- find
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "find projects" },
    ["<leader>d"] = { "<cmd> Telescope diagnostics <CR>", "show diagnostics" },
    ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles only_cwd=ture <CR>", "find oldfiles" },
    -- pick a hidden term
    ["<leader>tt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "stage hunk",
    },
    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "reset hunk",
    },
    ["<leader>hS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "stage buffer",
    },
    ["<leader>hu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "undo stage hunk",
    },
    ["<leader>hR"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "reset buffer",
    },
    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "preview hunk",
    },
    ["<leader>hb"] = {
      function()
        require("gitsigns").blame_line { full = true }
      end,
      "blame line",
    },
    ["<leader>hd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "diffthis",
    },
    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "toggle deleted",
    },
    ["<leader>tb"] = {
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      "toggle current line blame",
    },
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

-- new plugin mappings
M.todo_comments = {
  plugin = true,
  n = {
    ["<leader>m"] = { "<cmd> TodoTelescope <CR>", "show TODOs" },
  },
}

M.noegen = {
  plugin = true,
  n = {
    ["<leader>a"] = { "<cmd> Neogen <CR>", "generate annotation" },
  },
}

M.symbols_outline = {
  plugin = true,
  n = {
    ["<leader>o"] = { "<cmd> SymbolsOutline <CR>", "toggle symbols outline" },
  },
}

M.goto_preview = {
  plugin = true,
  n = {
    ["<leader>pd"] = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "preview devifition" },
    ["<leader>pt"] = {
      "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
      "preview type definition",
    },
    ["<leader>pi"] = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "preview implementation" },
    ["<leader>px"] = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "closs all preview windows" },
    ["<leader>pr"] = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "preview references" },
  },
}

M.diffview = {
  plugin = true,
  n = {
    ["<leader>gd"] = { "<cmd> DiffviewOpen <CR>", "open diff view" },
    ["<leader>gh"] = { "<cmd> DiffviewFileHistory % <CR>", "open current file history" },
    ["<leader>gx"] = { "<cmd> DiffviewClose <CR>", "close diff view" },
    ["<leader>gr"] = { "<cmd> DiffviewRefresh <CR>", "referesh diff view" },
  },
}

M.disabled = {
  n = {
    -- general
    ["<leader>n"] = "",
    -- nvterm
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    -- gitsigns
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
  },
}

return M
