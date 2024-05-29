local opt = vim.opt

-- Don't show the mode, since it's already in the status line
opt.showmode = false

opt.autoread = true

-- Set highlight on search
opt.hlsearch = false

-- Make line numbers default
opt.relativenumber = true
opt.number = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.shiftround = true

-- Enable break indent
opt.breakindent = true
opt.linebreak = true

-- Enable mouse mode
opt.mouse = "a"

-- Clipboard
opt.clipboard:prepend({ "unnamed", "unnamedplus" })

-- Save undo history
opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.updatetime = 250

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- remove underscore from keyword
opt.iskeyword:remove("_")

-- Fold
vim.opt.foldmethod = "manual"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
