return {
  {"catppuccin/nvim"},
  -- You can also add new plugins here as well:
  { "wakatime/vim-wakatime",
  lazy = false },
  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  { "lervag/vimtex" },
  { "neovim/nvim-lspconfig" },
  { 
    "simrat39/rust-tools.nvim",
    after = "mason-lspconfig.nvim",
    -- Is configured via the server_registration_override installed below!
    config = function()
      require("rust-tools").setup {
        -- server = astronvim.lsp.config "rust_analyzer",
        tools = {
          inlay_hints = {
            parameter_hints_prefix = "  ",
            other_hints_prefix = "  ",
          },
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }
}
