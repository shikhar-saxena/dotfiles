-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Change split movements
keymap.set("n", "<C-J>", "<C-W><C-J>", { noremap = true })
keymap.set("n", "<C-H>", "<C-W><C-H>", { noremap = true })
keymap.set("n", "<C-K>", "<C-W><C-K>", { noremap = true })
keymap.set("n", "<C-L>", "<C-W><C-L>", { noremap = true })

keymap.set("n", "x", '"_x')

-- increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
