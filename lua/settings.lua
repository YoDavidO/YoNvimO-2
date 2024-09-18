-- lua/settings.lua
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true

-- Visual
opt.termguicolors = true -- Enable 24-bit RGB Color
opt.cursorline = true -- Highlight current line
opt.signcolumn = "yes" -- Always show sign column
opt.colorcolumn = "180" -- Show a column @ 80 characters	

-- Search
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Don't ignore case if search pattern has uppercase

-- Performance
opt.lazyredraw = true -- Don't redraw screen while executing macros

-- Misc
opt.hidden = true -- Allow switching buffers without saving
opt.mouse = "a" -- Enable mouse support
