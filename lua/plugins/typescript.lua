---@type LazySpec
return {
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true, -- run require("template-string").setup()
  },
  -- { -- Doesn't work for some reason
  --   "barrett-ruth/import-cost.nvim",
  --   build = "sh install.sh npm",
  --   ft = {
  --     "javascript",
  --     "typescript",
  --     "javascriptreact",
  --     "typescriptreact",
  --   },
  --   config = true,
  -- },
  "wuelnerdotexe/vim-astro",
}
