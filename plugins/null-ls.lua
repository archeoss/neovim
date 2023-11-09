return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
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
    }
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- typescript.extensions.null-ls.code-actions,
      -- Set a formatter .nvim/lua/null-ls/loop.lua:165: command cspell is not executable (make sure it's installed and on your $PATH)
      -- null_ls.builtins.diagnostics.cspell,
      -- null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,
}
