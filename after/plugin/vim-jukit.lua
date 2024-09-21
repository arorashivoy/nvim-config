-- TODO: Create the config the add a highlight color in between the file
-- TODO: Create a new .ipynb file from nvim

vim.g.jukit_notebook_viewer = 'code'
vim.g.jukit_highlight_markers = 0
vim.g.jukit_enable_textcell_bg_hl = 0
vim.g.jukit_convert_overwrite_default = 1
vim.g.jukit_cellmarker_colors = 1

-------------------------------------------------
-- Vim Jukit Color scheme present in color.lua --
-------------------------------------------------
-- vim.cmd("highlight jukit_cellmarker_colors guifg=#1d615a guibg=#1d615a ctermbg=22 ctermfg=22")


--------------------------------------------------------
-- Remapping keymap to remove enter(<cr>) as a keymap --
--------------------------------------------------------
-- Send current line to output split
vim.keymap.set("n", "<leader><cr>", ":call jukit#send#line()<cr>", { desc = "Send current line(Jukit)" })
-- Send visually selected code to output split
vim.keymap.set("v", "<leader><cr>", ":<C-U>call jukit#send#selection()<cr>", { desc = "Send selection(Jukit)" })
