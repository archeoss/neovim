-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- Custom settings
    -- BEGIN
    --guifont = "Source Code Pro:h8",
    guifont = "JetBrainsMono Nerd Font:h11",
    linespace = 3,
    --END
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = false, -- sets vim.opt.wrap
  },
  g = {
    --Custom Settings
    --BEGIN
    neovide_refresh_rate = 120,
    -- neovide_refresh_rate_idle = 5,
	  
    neovide_transparency = 1,
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

    neovide_scale_factor=1.25,
    
    -- neovide_profiler = true,

    -- copilot_no_tab_map = true,
    --END
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    -- DISCORD
    -- BEGIN
    presence_auto_update         = 1,
    presence_neovim_image_text   = "The One True Text Editor",
    presence_main_image          = "neovim",
    presence_client_id           = "793271441293967371",
    presence_debounce_timeout    = 10,
    presence_enable_line_number  = 0,
    presence_buttons             = 1,
    presence_show_time           = 1,
    -- presence_log_level            = "debug",
    -- Rich Presence text options
    presence_editing_text        = "Editing %s",
    presence_file_explorer_text  = "Browsing %s",
    presence_git_commit_text     = "Committing changes",
    presence_plugin_manager_text = "Managing plugins",
    presence_reading_text        = "Reading %s",
    presence_workspace_text      = "Working on %s",
    presence_line_number_text    = "Line %s out of %s",
    -- END
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
