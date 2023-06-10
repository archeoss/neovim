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
          end,
        })
      end,
      -- For eslint_d:
      eslint_d = function()
        require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
              or utils.root_has_file ".eslintrc.json"
              or utils.root_has_file ".eslintrc.js"
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
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,
}
