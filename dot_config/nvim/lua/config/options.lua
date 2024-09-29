-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- -- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Enable mouse mode
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show relative and absolute line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Syntax highlighting
vim.opt.syntax = "on"

-- Tab and indentation settings
-- vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
-- vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.opt.expandtab = false -- Use spaces instead of tabs (set to true if desired)
-- vim.opt.softtabstop = 4 -- See multiple spaces as tabstops so <BS> does the right thing
vim.opt.fixendofline = false -- Do not add newline at the end of the file

-- Search settings
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- UI settings
vim.opt.showcmd = true -- Show incomplete commands in the bottom-right
vim.opt.cursorline = true -- Highlight the current line
vim.opt.ruler = true -- Show cursor position in the status line
vim.opt.wildmenu = true -- Enhanced command line completion
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.splitright = true -- New vertical splits go to the right
vim.opt.splitbelow = true -- New horizontal splits go below
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor

-- List characters settings
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- vim.opt.listchars:append("space:␣")  -- Show spaces
-- vim.opt.listchars:append("tab:» ")    -- Customize tab representation

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Disable compatibility to old-time vi
-- vim.opt.nocompatible = true

-- Show matching brackets
vim.opt.showmatch = true

-- Speed up scrolling in Vim
vim.opt.ttyfast = true

-- Enable spell check (uncomment if needed)
-- vim.opt.spell = true

-- Additional options
-- Uncomment the line below if you encounter issues with lazyredraw
-- vim.opt.lazyredraw = true

-- vim: ts=2 sts=2 sw=2 et
