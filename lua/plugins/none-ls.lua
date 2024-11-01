-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    config.sources = {
      handlers = {
        -- for prettier
        prettier = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".prettierrc"
                or utils.root_has_file ".prettierrc.json"
                or utils.root_has_file ".prettierrc.js"
                or utils.root_has_file ".prettierrc.cjs"
            end,
          })
        end,
        -- for prettierd
        prettierd = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".prettierrc"
                or utils.root_has_file ".prettierrc.json"
                or utils.root_has_file ".prettierrc.js"
                or utils.root_has_file ".prettierrc.cjs"
            end,
          })
        end,
        -- For eslint_d:
        eslint = function()
          require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.js"
                or utils.root_has_file ".eslintrc.cjs"
            end,
          })
        end,
      },
      -- require("go.null_ls").gotest(),
      require("go.null_ls").gotest_action(),
      require("go.null_ls").golangci_lint().with {
        extra_args = {
          "-c",
          "ci/lint/.golangci.yaml",
        },
      },
      null_ls.builtins.formatting.golines.with {
        extra_args = {
          "--max-len=120",
          "--base-formatter=\"gofumpt -extra\"",
        },
      },
      null_ls.builtins.diagnostics.revive.with {
        args = {
          "-config",
          "/home/archeoss/.config/revive/defaults.toml",
          "-formatter",
          "json",
          "./...",
        },
      },
      null_ls.builtins.formatting.goimports.with {
        args = {
          "-local",
          "core-ovn",
        },
      },
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,
}
