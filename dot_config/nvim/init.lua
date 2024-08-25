vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


local autocmd = vim.api.nvim_create_autocmd

autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})


-- General settings
vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true    -- Relative line numbers
vim.opt.syntax = 'enable'        -- Enable syntax highlighting
vim.opt.expandtab = true         -- Convert tabs to spaces
vim.opt.tabstop = 4              -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4           -- Number of spaces for each step of (auto)indent
vim.opt.smartindent = true       -- Automatically insert indents
vim.opt.ignorecase = true        -- Ignore case when searching
vim.opt.smartcase = true         -- Override ignorecase if search term contains uppercase
vim.opt.incsearch = true         -- Show search matches as you type
vim.opt.hlsearch = true          -- Highlight search matches
vim.opt.clipboard = 'unnamedplus'-- Use the system clipboard
vim.opt.mouse = 'a'              -- Enable mouse support
vim.opt.cursorline = true        -- Highlight the current line
vim.opt.ruler = true             -- Show cursor position in the status line
vim.opt.wildmenu = true          -- Enhanced command line completion
vim.opt.lazyredraw = true        -- Redraw screen only when needed (improves performance)
vim.opt.ttyfast = true           -- Improve performance on slow terminals
vim.api.nvim_set_option("clipboard", "unnamed")
-- Backup and Undo
vim.opt.backup = true            -- Enable backups
vim.opt.writebackup = true       -- Write backup before overwriting a file
vim.opt.undofile = true          -- Enable persistent undo
vim.opt.swapfile = true          -- Enable swap file creation

vim.opt.backupdir = '~/.local/share/nvim/backup//'
vim.opt.directory = '~/.local/share/nvim/swap//'
vim.opt.undodir = '~/.local/share/nvim/undo//'

