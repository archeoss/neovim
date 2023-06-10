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
      			-- whether to align to the length of the longest line in the file
      			max_len_align = true,

      			-- padding from the left if max_len_align is true
      			max_len_align_padding = 2,
            
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
  },
  -- React
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
	{
		"lvimuser/lsp-inlayhints.nvim",
		branch = "main", -- or "anticonceal"
		config = function()
			require("plugins.inlay-hints")
		end,
	},
	{
		"barrett-ruth/import-cost.nvim",
		build = "sh install.sh yarn",
		ft = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		config = true,
	},
	-- Testing
	{
		"rcarriga/neotest",
		-- adapters = {
  --     require("neotest-rust")
  --   },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("plugins.neotest")

		end,
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
		config = function()
			require("coverage").setup()
		end,
	},
	{
		'saecki/crates.nvim',
		tag = 'v0.3.0',
		ft = {"rust", "toml"},
    requires = { 'nvim-lua/plenary.nvim' },
    null_ls = require('null-ls'),
    null_ls = { 
    	enabled = true,
      name = "crates.nvim",
    },
    config = function(_, opts)
        local crates = require('crates')
        crates.setup()
        crates.show()
    end,
	},
	{ 
		"hrsh7th/nvim-cmp",
		sources = {
			{ name = "crates"},
		}
	},

	-- THEME
	{ 
		"folke/tokyonight.nvim"
	},

	-- Discord 
	{
		'andweeb/presence.nvim',
		lazy = false
	},

	-- C/C++
	{
		"p00f/clangd_extensions.nvim",
	},-- install lsp plugin
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clangd" }, -- automatically install lsp
    },
  },
}
