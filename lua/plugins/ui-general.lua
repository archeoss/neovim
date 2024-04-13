---@type LazySpec
return {
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
      progress = {
        display = {
          overrides = { -- Override options from the default notification config
            rust_analyzer = { name = "rust-analyzer" },
          },
        },
      },
      notification = {
        window = {
          max_width = 75,
        },
      },
    },
  },
}
