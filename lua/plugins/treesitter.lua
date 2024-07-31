---@type LazySpec
return {
  {"nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.dbml = {
--   install_info = {
--     url = "/home/archeoss/treesitter-parsers/tree-sitter-dbml", -- local path or git repo
--     files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
--     -- optional entries:
--     generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--     requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--   },
--   filetype = "dbml", -- if filetype does not match the parser name
-- }
    -- vim.treesitter.language.register("ecma", "dbml")
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    })
  end,
  },
  {"jidn/vim-dbml"}
}
