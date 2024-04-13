-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    lazy = false,
    config = function()
      require('distant'):setup()
    end
  },
}
