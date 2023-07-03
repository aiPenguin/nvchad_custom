local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "cpp",
    "cmake",
    "markdown",
    "markdown_inline",
    "python",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "json-lsp",
    "prettier",

    -- python
    "pyright",
    "black",

    -- cpp
    "clangd",
    "clang-format",

    -- cmake
    "cmake-language-server",
    "cmakelang",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    full_name = true,
    root_folder_label = ":~:s?$?/..?",
    highlight_opened_files = "icon",
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  sources = {
    { name = "cmp-cmdline" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

M.telescope = {
  extensions_list = { "themes", "terms", "projects", "todo-comments" },
}

return M
