---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>s"] = { "<cmd> w <CR>", "save file" },
  },
}

-- more keybinds!
M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "find projects" },
  }
}

return M
