---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true, -- enable or disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    formatting = {
      format_on_save = {
        enabled = true,
        -- enabled = false,
        allow_filetypes = {
          -- "go",
        },
        ignore_filetypes = {
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      -- "rust_analyzer",
    },
    ---@diagnostic disable: missing-fields
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            -- For Linux Development
            -- linkedProjects = { "./qemu-rust-linux/linux-master/rust-project.json" },

            diagnostics = {
              disabled = { "unresolved-proc-macro" },
              experimental = { enable = true },
            },
            -- cachePriming = {
            --   enable = false
            -- },
            -- assist = {
            --     importGranularity = "module",
            --     importPrefix = "by_self",
            -- },
            cargo = {
              allFeatures = true,
              buildScripts = {
                enable = true,
              },
            },
            -- procMacro = {
            --   enable = true
            -- },
            check = {
              features = "all",
              overrideCommand = {
                "cargo",
                "clippy",
                "--workspace",
                "--message-format=json",
                "--all-targets",
                "--",
                "-W",
                "clippy::pedantic",
                "-W",
                "clippy::nursery",
                "-W",
                "clippy::unwrap_used",
                "-W",
                "clippy::expect_used",
                "-W",
                "clippy::all",
              },
            },
            checkOnSave = true,
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      },
      tsserver = {
        settings = {
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
        },
        root_dir = require("lspconfig.util").root_pattern "package.json",
      },
      eslint = {
        root_dir = require("lspconfig.util").root_pattern(
          "package.json",
          ".eslintrc.json",
          ".eslintrc.js",
          ".eslintrc.cjs"
        ),
      },
      astro = {
        root_dir = require("lspconfig.util").root_pattern "package.json",
      },
      clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
    },
    -- customize how language servers are attached
    handlers = {
      rust_analyzer = false,
      ltex = function(_, opts)
        require("ltex_extra").setup {
          server = opts,
        }
      end,
      -- clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
      -- rust_analyzer = function(_, opts)
      --   require("rustaceanvim").setup {
      --     tools = {
      --       inlay_hints = {
      --         -- whether to align to the length of the longest line in the file
      --         -- max_len_align = true,
      --
      --         -- padding from the left if max_len_align is true
      --         max_len_align_padding = 2,
      --         parameter_hints_prefix = " ",
      --         other_hints_prefix = " ",
      --       },
      --     },
      --     server = opts,
      --   }
      -- end,
      tsserver = function(_, opts) require("typescript").setup { server = opts } end,
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      lsp_document_highlight = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/documentHighlight",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "CursorHold", "CursorHoldI" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "Document Highlighting",
          callback = function() vim.lsp.buf.document_highlight() end,
        },
        {
          event = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc = "Document Highlighting Clear",
          callback = function() vim.lsp.buf.clear_references() end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        -- gD = {
        --   function() vim.lsp.buf.declaration() end,
        --   desc = "Declaration of current symbol",
        --   cond = "textDocument/declaration",
        -- },
        -- ["<Leader>uY"] = {
        --   function() require("astrolsp.toggles").buffer_semantic_tokens() end,
        --   desc = "Toggle LSP semantic highlight (buffer)",
        --   cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
        -- },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
      require("clangd_extensions.inlay_hints").setup_autocmd()
      require("clangd_extensions.inlay_hints").set_inlay_hints()
      -- inlay hints
      local ih = require "lsp-inlayhints"
      ih.setup()
      ih.on_attach(client, bufnr)
    end,
  },
}
