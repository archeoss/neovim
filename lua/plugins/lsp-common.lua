-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  { "simrat39/inlay-hints.nvim" },
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "main", -- or "anticonceal"
    -- lazy = false,
    after = { "williamboman/mason-lspconfig.nvim" },
    config = function() require "inlay-hints" end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function() require("lsp_lines").setup() end,
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    sources = {
      { name = "crates" },
    },
  },
  { "kevinhwang91/nvim-bqf", ft = "qf" },
}
