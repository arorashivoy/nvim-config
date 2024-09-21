local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add the current file to the Harpoon bookmarks" })
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Toggle the Harpoon menu" })

vim.keymap.set("n", "<C-y>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
