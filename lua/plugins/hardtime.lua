if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      max_time = 1000,
      max_count = 10,
      disable_mouse = false,
      hint = true,
      notification = true,
      -- allow_different_key = false,
      restricted_keys = {
        ["-"] = {}, -- Remove from default list
        ["<C-M>"] = {},
        ["<C-N>"] = {},
        ["<C-P>"] = {},
        ["<CR>"] = {},
      },
      resetting_keys = {
        ["s"] = {},
        ["S"] = {},
      },
      disabled_keys = {
        ["<CR>"] = {},
      },
      disabled_filetypes = {
        "qf",
        "netrw",
        "NeogitStatus",
        "DiffviewFilePanel",
        "query",
        "harpoon",
        "minifiles",
        "toggleterm",
        "dapui_stacks",
        "dapui_console",
        "dapui-repl",
        "dapui_watches",
        "dapui_breakpoints",
      },
    },
  },
}
