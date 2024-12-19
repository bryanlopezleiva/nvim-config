-- Ensure lazy.nvim is set up properly
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim and add plugins
require("lazy").setup({
  -- Import your custom plugin configurations
  { import = "bryanlopez.plugins" },
  { import = "bryanlopez.plugins.lsp" },

  -- Markdown Preview Plugin
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  -- Vimtex for LaTeX
  {
    "lervag/vimtex",
    ft = { "tex", "latex" },
    config = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },

  -- LuaSnip Plugin
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load() -- Load VSCode-style snippets
    end,
  },

  -- Additional Snippet Libraries (optional, but useful)
  {
    "rafamadriz/friendly-snippets",
    lazy = true, -- Load only when snippets are needed
  },
}, {
  -- Lazy.nvim options
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
