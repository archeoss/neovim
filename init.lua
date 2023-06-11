return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  -- colorscheme = "astrodark",
  -- colorscheme = "catppuccin",
  colorscheme = "tokyonight-storm",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    on_attach = function(client, bufnr) 
      -- inlay hints
      local ih = require "lsp-inlayhints"
      ih.setup()
      ih.on_attach(client, bufnr)
    end,
    setup_handlers = {
        -- add custom handler
      clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
      rust_analyzer = function(_, opts) require("rust-tools").setup { 
        tools = {
          inlay_hints = {
      			-- whether to align to the length of the longest line in the file
      			-- max_len_align = true,

      			-- padding from the left if max_len_align is true
      			max_len_align_padding = 2,
            
            parameter_hints_prefix = "  ",
            other_hints_prefix = "  ",
          },
        },
        server = opts,
      } end,
      tsserver = function(_, opts) require("typescript").setup { server = opts } end,
    },
    
    formatting = {
      filter = function(client)
        -- -- disable formatting for lua_ls
        if client.name == "denols" then
          return false
        end
        --
        -- -- only enable null-ls for javascript files
        -- if vim.bo.filetype == "javascript" then
        --   return client.name == "null-ls"
        -- end
        --
        -- enable all other clients
        return true
      end,
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    
    -- Add overrides for LSP server settings, the keys are the name of the server
    ["config"] = {
      ['rust_analyzer'] = { 
        settings = {
          ['rust-analyzer'] = {
            -- diagnostics = {
            --   disabled = {"unresolved-proc-macro"},
            -- },
            -- assist = {
            --     importGranularity = "module",
            --     importPrefix = "by_self",
            -- },
            cargo = {
              buildScripts = {
                  enable = true,
              },
            },
            procMacro = {
              enable = true
            },
            checkOnSave = {
              allFeatures = true,
              overrideCommand = {
                'cargo', 'clippy', '--workspace', '--message-format=json',
                  '--all-targets', '--', '-W', 'clippy::pedantic', '-W', 'clippy::nursery',
                    '-W', 'clippy::unwrap_used', '-W', 'clippy::expect_used', '-W', 'clippy::all', '-W', 'clippy::cargo',
              }
            }
          }
        }
      },
      -- denols = function(opts)
      --   opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
      --   return opts
      -- end,
      ['tsserver'] = function(opts)
        opts.settings = {
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        }
        opts.root_dir = require("lspconfig.util").root_pattern("package.json")
        return opts
      end,
      -- For eslint:
      ['eslint'] = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("package.json", ".eslintrc.json", ".eslintrc.js")
        return opts
      end,
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      }
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
