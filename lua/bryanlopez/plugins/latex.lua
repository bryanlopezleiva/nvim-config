return {
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      -- Use Skim as the PDF viewer
      vim.g.vimtex_view_method = "skim"

      -- Configure forward search with Skim
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1

      -- Enable automatic LaTeX compilation
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },
}
