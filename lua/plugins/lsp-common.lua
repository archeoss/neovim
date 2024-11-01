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
  -- {
  --   "echasnovski/mini.completion",
  --   -- lazy = false,
  --   opts = {},
  -- },
  -- {
  --   "amarakon/nvim-cmp-buffer-lines",
  --   lazy = true,
  --   specs = {
  --     {
  --       "hrsh7th/nvim-cmp",
  --       dependencies = { "amarakon/nvim-cmp-buffer-lines" },
  --       opts = function(_, opts)
  --         local cmp = require "cmp"
  --         return require("astrocore").extend_tbl(opts, {
  --           mapping = {
  --             ["<C-x><C-l>"] = cmp.mapping.complete { -- this could've been a more ergonomic hotkey, but it would be a reach to try to make up one, that would fit everyone.
  --               config = {
  --                 sources = {
  --                   {
  --                     name = "buffer-lines",
  --                     priority = 50,
  --                     option = {
  --                       leading_whitespace = false,
  --                     },
  --                   },
  --                 },
  --               },
  --             },
  --           },
  --         })
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   "ms-jpq/coq_nvim",
  --   branch = "coq",
  --   event = "InsertEnter",
  --   build = ":COQdeps",
  --   cmd = { "COQnow", "COQhelp", "COQstats", "COQdeps" },
  --   specs = {
  --     { "hrsh7th/nvim-cmp", optional = true, enabled = false },
  --     { "hrsh7th/cmp-buffer", optional = true, enabled = false },
  --     { "hrsh7th/cmp-nvim-lsp", optional = true, enabled = false },
  --     { "hrsh7th/cmp-path", optional = true, enabled = false },
  --     { "L3MON4D3/LuaSnip", optional = true, enabled = false },
  --     { "saadparwaiz1/cmp_luasnip", optional = true, enabled = false },
  --     { "rcarriga/cmp-dap", optional = true, enabled = false },
  --   },
  --   dependencies = {
  --     { "ms-jpq/coq.artifacts", branch = "artifacts" },
  --     {
  --       "AstroNvim/astrocore",
  --       opts = {
  --         options = {
  --           g = {
  --             coq_settings = {
  --               auto_start = "shut-up",
  --               keymap = { jump_to_mark = "<Tab>" },
  --             },
  --           },
  --         },
  --       },
  --     },
  --     {
  --       "AstroNvim/astrolsp",
  --       optional = true,
  --       opts = {
  --         capabilities = {
  --           textDocument = {
  --             completion = {
  --               completionItem = {
  --                 deprecatedSupport = true,
  --                 insertReplaceSupport = true,
  --                 insertTextModeSupport = { valueSet = { 1, 2 } },
  --                 labelDetailsSupport = true,
  --                 preselectSupport = true,
  --                 resolveSupport = { properties = {} },
  --                 snippetSupport = true,
  --                 tagSupport = { valueSet = { 1 } },
  --               },
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
  -- { "kevinhwang91/nvim-bqf", ft = "qf" },
}
