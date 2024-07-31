---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    -- optional = true,
    dependencies = {
      -- "mrcjkb/rustaceanvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },

    -- opts = {
      -- Doesn't work for some reason
      -- adapters = {
      --   -- require "neotest-rust",
      --   require "rustaceanvim.neotest",
      -- },

      -- taken from AstroCommunity
      opts = function(_, opts)
        if not opts.adapters then opts.adapters = {} end
        local rustaceanvim_avail, rustaceanvim = pcall(require, "rustaceanvim.neotest")
        if rustaceanvim_avail then table.insert(opts.adapters, rustaceanvim) end
      end,
    -- },
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      commands = true
    }
    -- cmd = {
    --   "Coverage",
    --   "CoverageSummary",
    --   "CoverageLoad",
    --   "CoverageShow",
    --   "CoverageHide",
    --   "CoverageToggle",
    --   "CoverageClear",
    -- },
    -- config = function() require("coverage").setup() end,
  },
}
