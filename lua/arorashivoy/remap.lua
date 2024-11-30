vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open the File Explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Vim-Tmux Navigator
vim.keymap.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft, { desc = "Navigate Left in Tmux" })
vim.keymap.set("n", "<C-j>", vim.cmd.TmuxNavigateDown, { desc = "Navigate Down in Tmux" })
vim.keymap.set("n", "<C-k>", vim.cmd.TmuxNavigateUp, { desc = "Navigate Up in Tmux" })
vim.keymap.set("n", "<C-l>", vim.cmd.TmuxNavigateRight, { desc = "Navigate Right in Tmux" })

-- Command for save
vim.keymap.set("n", "<M-s>", ":w<CR>", { desc = "Save" })

-- Create a new buffer
-- vim.keymap.set("n", "<leader>b", ":enew<CR>", { desc = "Create new Buffer" })

-- Open floating debug menu
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open floating diagnostic menu" })

-- Using :Q as well to quit
vim.api.nvim_create_user_command('Q', 'q', {})

-- -- Command Key usage with iterm2 
-- vim.keymap.set("i", "<C-1>", "<C-o>o", { desc =  "Open a new line below" })
-- vim.keymap.set("i", "<C-2>", "<C-o>$", { desc = "Go to the line end" })
-- vim.keymap.set("i", "<C-3>", "<C-o>0", { desc = "Go to the line begining" })
-- vim.keymap.set("i", "<C-4>", "<C-o>w", { desc = "Go to next word" })
-- vim.keymap.set("i", "<C-5>", "<C-o>b", { desc = "Go to previous word" })
