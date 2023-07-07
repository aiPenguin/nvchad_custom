local overrides = require "custom.configs.overrides"
local cmp = require "cmp"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "CmdlineEnter", "InsertEnter" },
    opts = overrides.cmp,
    dependencies = {
      { "hrsh7th/cmp-cmdline" },
    },
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    }),
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    }),
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end,
    event = "VimEnter",
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    cmd = "TodoTelescope",
    init = function()
      require("core.utils").load_mappings "todo_comments"
    end,
    opts = require "custom.configs.todo-comments",
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },

  {
    "danymat/neogen",
    lazy = true,
    cmd = "Neogen",
    init = function()
      require("core.utils").load_mappings "noegen"
    end,
    opts = require "custom.configs.neogen",
    config = function(_, opts)
      require("neogen").setup(opts)
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  },

  {
    "enddeadroyal/symbols-outline.nvim",
    branch = "bugfix/symbol-hover-misplacement",
    cmd = "SymbolsOutline",
    init = function()
      require("core.utils").load_mappings "symbols_outline"
    end,
    event = "BufRead",
    config = function()
      require("symbols-outline").setup()
    end,
  },

  {
    "rmagatti/goto-preview",
    lazy = true,
    init = function()
      require("core.utils").load_mappings "goto_preview"
    end,
    opts = require "custom.configs.goto-preview",
    config = function(_, opts)
      require("goto-preview").setup(opts)
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    init = function()
      require("core.utils").load_mappings "diffview"
    end,
    config = function()
      require("diffview").setup()
    end,
  },

  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      require "custom.configs.copilot"
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
