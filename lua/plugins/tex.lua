---@type LazySpec
return {
  { "lervag/vimtex" },
  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "tex" },
    dependencies = { "neovim/nvim-lspconfig" },
  },
}
