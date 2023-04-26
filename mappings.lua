---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>s"] = { "<cmd> w <CR>", "save file" },
    ["<leader>td"] = { "<cmd> Telescope todo-comments <CR>", "show TODOs" },
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

-- more keybinds!
M.telescope = {
  plugin = true,
  n = {
    -- find
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "find projects" },
  },
}

return M
