return {
  {
    "preservim/vim-markdown", -- Adds Markdown syntax and folding
    dependencies = { "godlygeek/tabular" }, -- Useful for formatting tables
    ft = "markdown",
    config = function()
      -- Enable Markdown folding
      vim.g.vim_markdown_folding_disabled = 0
    end,
  },
  {
    "iamcco/markdown-preview.nvim", -- Live Markdown preview
    build = "cd app && npm install", -- or use yarn: "cd app && yarn install"
    ft = "markdown",
    cmd = "MarkdownPreview",
    config = function()
      vim.g.mkdp_auto_start = 0 -- Preview on-demand
      vim.g.mkdp_theme = "dark" -- Optional: Set a theme for Markdown preview
    end,
  },
}
