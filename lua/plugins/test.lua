---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "mrcjkb/rustaceanvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },

    opts = {
      -- Doesn't work for some reason
      -- adapters = {
      --   -- require "neotest-rust",
      --   require "rustaceanvim.neotest",
      -- },

      -- taken from AstroCommunity
      opts = function(_, opts)
        opts.adapters = opts.adapters or {}
        vim.list_extend(opts.adapters, {
          require "rustaceanvim.neotest",
        })
      end,
    },
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = {
      "Coverage",
      "CoverageSummary",
      "CoverageLoad",
      "CoverageShow",
      "CoverageHide",
      "CoverageToggle",
      "CoverageClear",
    },
    config = function() require("coverage").setup() end,
  },
}
