-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      -- ensure_installed = { "lua_ls" },
      ensure_installed = { "rust_analyzer", "tsserver", "texlab" },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      -- ensure_installed = { "prettier", "stylua" },
      ensure_installed = { "eslint_d", }
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      handlers = {
          python = function(source_name)
            local dap = require "dap"
            dap.adapters.python = {
              type = "executable",
              command = "/usr/bin/python3",
              args = {
                "-m",
                "debugpy.adapter",
              },
            }

            dap.configurations.python = {
              {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}", -- This configuration will launch the current file if used.
              },
            }
          end,
        },
        -- adapter = require('rust-tools.dap').get_codelldb_adapter(
        --     extension_path .. 'adapter/codelldb',
        --     extension_path .. 'lldb/lib/liblldb.so'),
      ensure_installed = { "codelldb" }
      -- ensure_installed = { "python" },
    },
  },
}
