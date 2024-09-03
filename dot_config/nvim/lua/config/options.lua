-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Use a line cursor within insert mode and a block cursor everywhere else.
vim.opt.guicursor = {
  "n-v-c:block", -- Normal, Visual, Command mode: block cursor
  "i:ver25", -- Insert mode: vertical bar (line cursor)
  "r-cr:hor20", -- Replace mode: horizontal bar (line cursor)
  "sm:block-blinkon0", -- Command-line mode: block cursor with no blinking
}

-- Relative line numbers
vim.opt.relativenumber = true

-- Syntax highlighting
vim.cmd("syntax on")

-- Tabs and indentation
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Clipboard and mouse
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- UI settings
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.wildmenu = true
vim.opt.ttyfast = true
vim.g.autoformat = false
vim.opt.fixendofline = false
-- vim.opt.writebackup = true
-- vim.opt.undofile = true
-- vim.opt.swapfile = true
--
-- vim.opt.backupdir = vim.fn.expand("~/.vim/backup//")
-- vim.opt.directory = vim.fn.expand("~/.vim/swap//")
-- vim.opt.undodir = vim.fn.expand("~/.vim/undo//")

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line
    if line("'\"") > 1 and line("'\"") <= line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})

-- Command to save with sudo if needed
vim.api.nvim_set_keymap("c", "w!!", "w !sudo tee > /dev/null %", { noremap = true })
