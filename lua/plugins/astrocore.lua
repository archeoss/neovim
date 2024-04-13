-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        guifont = "JetBrainsMono NFM:h11", -- Font
        linespace = 3, -- Space between lines
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        neovide_refresh_rate = 100,
        -- neovide_refresh_rate = 150,
        -- neovide_refresh_rate_idle = 5,

        neovide_transparency = 0.95,
        neovide_cursor_animation_length = 0.08,
        neovide_cursor_trail_length = 0.55,
        neovide_cursor_antialiasing = true,
        neovide_cursor_vfx_mode = "ripple",
        neovide_cursor_vfx_opacity = 200.0,
        neovide_cursor_vfx_particle_lifetime = 1.2,
        neovide_cursor_vfx_particle_speed = 20.0,
        neovide_cursor_vfx_particle_density = 5.0,

        neovide_padding_top = 0,
        neovide_padding_bottom = 0,
        neovide_padding_right = 0,
        neovide_padding_left = 0,

        neovide_hide_mouse_when_typing = true,

        neovide_underline_automatic_scaling = true,

        neovide_scale_factor = 1.5,

        -- neovide_profiler = true,

        -- copilot_no_tab_map = true,
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start

        -- Disable virtual_text since it's redundant due to lsp_lines.
        diagnostics_mode = 2, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)

        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements

        -- DISCORD
        presence_auto_update = 1,
        presence_neovim_image_text = "The One True Text Editor",
        presence_main_image = "neovim",
        presence_client_id = "793271441293967371",
        presence_debounce_timeout = 10,
        presence_enable_line_number = 0,
        presence_buttons = 1,
        presence_show_time = 1,
        -- presence_log_level            = "debug",
        -- Rich Presence text options
        presence_editing_text = "Editing %s",
        presence_file_explorer_text = "Browsing %s",
        presence_git_commit_text = "Committing changes",
        presence_plugin_manager_text = "Managing plugins",
        presence_reading_text = "Reading %s",
        presence_workspace_text = "Working on %s",
        presence_line_number_text = "Line %s out of %s",
        -- DISCORDEND
        -- Astro
        astro_typescript = "enable",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        ["<Leader>ln"] = { desc = "Neotest" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        -- ["<leader>l:"] = {
        --   require("lsp_lines").toggle,
        --   desc = "Toggle lsp_lines",
        -- },
        ["<leader>l:"] = { function() require("lsp_lines").toggle() end, desc = "Toggle lsp_lines" },
        ["."] = { ":BaconLoad<CR>:w<CR>:BaconNext<CR>" },
        [","] = { ":BaconList<CR>" },
        ["<leader>u;"] = {
          function(_delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.25 end,
          desc = "Zoom In",
        },
        ["<leader>u:"] = {
          function(_delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.25 end,
          desc = "Zoom Out",
        },
        ["<leader>lnr"] = { function() require("neotest").run.run() end, desc = "[n]eotest: [r]un nearest" },
        ["<leader>lnf"] = {
          function() require("neotest").run.run(vim.api.nvim_buf_get_name(0)) end,
          desc = "[n]eotest: run [f]ile",
        },
        ["<leader>lno"] = { function() require("neotest").output.open() end, desc = "[n]eotest: [o]pen output" },
        ["<leader>lns"] = { function() require("neotest").summary.toggle() end, desc = "[n]eotest: toggle [s]ummary" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      i = {
        ["C-x"] = { "lsp#scroll(+8)" },
        ["C-d"] = { "lsp#scroll(-8)" },
      },
    },
  },
}
