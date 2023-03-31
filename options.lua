-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- Custom settings
    -- BEGIN
    --guifont = "Source Code Pro:h8",
    guifont = "JetBrainsMono Nerd Font:h8",
    --END
    -- set to true or false etc.
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
    neovide_refresh_rate = 90,
    neovide_refresh_rate_idle = 5,
	  
	  neovide_cursor_animation_length = 0.09,
	  neovide_cursor_trail_length = 0.15,
	  neovide_cursor_antialiasing = true,
	  --neovide_cursor_vfx_opacity = 200.0,
	  --neovide_cursor_vfx_particle_lifetime = 1.2,
	  --neovide_cursor_vfx_particle_speed = 20.0,
	  --neovide_cursor_vfx_particle_density = 5.0,

    neovide_hide_mouse_when_typing = true,
    neovide_profiler = false,

    -- copilot_no_tab_map = true,
    --END
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
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
