---@type LazySpec
return {
  {
    "jinh0/eyeliner.nvim",
    opts = {
      highlight_on_key = true, -- show highlights only after keypress
      dim = true, -- dim all other characters
    },
  },
  { "chaoren/vim-wordmotion" },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("wildfire").setup() end,
  },
}
