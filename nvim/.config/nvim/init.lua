require("statusline")
require("keymaps")

-- =======================================================================
-- OPTIONS
-- =======================================================================

vim.o.number = true

vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Save undo history
local undodir = vim.fn.expand("~/.vim/undodir")
if
  vim.fn.isdirectory(undodir) == 0      -- create undodir if nonexistent
then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.undofile = true                 -- do create an undo file
vim.opt.undodir = undodir               -- set the undo directory
vim.opt.backup = false                  -- do not create a backup file
vim.opt.writebackup = false             -- do not write a backup file
vim.opt.swapfile = false                -- do not create a swap file

vim.opt.hidden = true                   -- allow hidden buffers
vim.opt.errorbells = false              -- no error sounds
vim.opt.backspace = "indent,eol,start"  -- better backspace behaviour
vim.opt.autochdir = false               -- do not autochange directories
vim.opt.iskeyword:append("-")           -- include - in words
vim.opt.path:append("**")               -- include subdirs in search
vim.opt.selection = "inclusive"         -- include last char in selection
vim.opt.mouse = "a"                     -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true               -- allow buffer modifications
vim.opt.encoding = "utf-8"              -- set encoding

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.inccommand = "split"              -- Preview substitutions live, as you type
vim.o.cursorline = true                 -- Show which line the cursor is on
vim.o.scrolloff = 10                    -- Minimal number of screen lines to keep above and below the cursor

vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- cursor blinking and settings

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr"             -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99                  -- start with all folds open

vim.opt.splitbelow = true               -- horizontal splits go below
vim.opt.splitright = true               -- vertical splits go right

vim.opt.wildmenu = true                 -- tab completion
vim.opt.wildmode = "longest:full,full"  -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60")  -- improve diff display
vim.opt.redrawtime = 10000              -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000           -- increase max memory

-- If performing an operation that would fail due to unsaved changes in the buffer (like ':q'),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.opt.termguicolors = true

-- No background. I.e. use the terminals's background
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]])


