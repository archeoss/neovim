---@type LazySpec
return {
  { "lervag/vimtex", init = function() vim.g.vimtex_compiler_method = "tectonic" end },
  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "tex" },
    dependencies = { "neovim/nvim-lspconfig" },
  },
}
