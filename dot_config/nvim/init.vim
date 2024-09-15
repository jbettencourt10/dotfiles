" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
cmap w!! w !sudo tee > /dev/null %
set relativenumber " Show relative line numbers
syntax on
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set autoindent
set smartindent
set expandtab
set ignorecase
set smartcase
set incsearch
set hlsearch
set clipboard=unnamedplus
set mouse=a
set showcmd        " Show incomplete commands in the bottom-right
set showmode       " Display current mode (e.g., -- INSERT --)
set cursorline     " Highlight the current line
set ruler          " Show cursor position in the status line
set wildmenu       " Enhanced command line completion
set lazyredraw     " Redraw screen only when needed (improves performance)
set undofile        " Enable persistent undo
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
