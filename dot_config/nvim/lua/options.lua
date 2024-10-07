-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- [[ Setting options ]]
-- See `:help vim.opt`

-- Uncomment the next line to add relative line numbers
vim.opt.relativenumber = true

-- Make line numbers default
vim.opt.number = true

-- TODO: Check if this is needed with neovim
vim.cmd 'syntax on'

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set how Neovim will display certain whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type
vim.opt.inccommand = 'split'

-- Show the cursor line
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Set indentation options
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4 -- See multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true -- Expand tabs to spaces

-- Show matching brackets
vim.opt.showmatch = true

-- Show ruler (cursor position in the status line)
vim.opt.ruler = true

-- Enhanced command line completion
vim.opt.wildmenu = true

-- Enable persistent undo
vim.opt.undofile = true

-- Speed up scrolling in Neovim
vim.opt.ttyfast = true

-- Enable spell check (may need to download language package)
-- vim.opt.spell = true -- Uncomment to enable spell checking

-- Search settings
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Show incomplete commands in the bottom-right
vim.opt.showcmd = true

-- Redraw screen only when needed (improves performance)
vim.opt.lazyredraw = true

-- Disable compatibility mode with old vi
vim.opt.compatible = false

-- Show matching parentheses
vim.opt.showmatch = true

-- Set jinja files as html
vim.filetype.add({
  extension = {
    j2 = 'html',  -- Associate .j2 files with HTML filetype
  },
})
-- Set an 80-column border for good coding style
-- Good idea in principle, but in practice it's antiquated IMO
-- vim.opt.colorcolumn = '80'

-- Enable filetype plugins and indentation
vim.cmd 'filetype plugin indent on'

-- vim: ts=2 sts=2 sw=2 et
