-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    -- dependencies = { "rose-pine/neovim", as = "rose-pine"  },
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "astrodark",
      -- colorscheme = "rose-pine",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        init = { -- this table overrides highlights in all themes
          -- Normal = { bg = "#000000" },
          SpecialComment = { fg = "#00aaff" }
        },
        astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
          -- Normal = { bg = "#000000" },
        },
      },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   as = "rose-pine",
  --   opts = {
  --     extend_background_behind_borders = true,
  --
  --     enable = {
  --       terminal = true,
  --       legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
  --       migrations = true, -- Handle deprecated options automatically
  --     },
  --
  --     styles = {
  --       bold = true,
  --       italic = true,
  --       transparency = true,
  --     },
  --   },
  -- },
}
