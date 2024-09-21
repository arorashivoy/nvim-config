local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.load_extension("notify")
telescope.load_extension('project')
telescope.load_extension("file_browser")
telescope.load_extension("bibtex")
telescope.load_extension('fzf')        -- without this there's no 'foo | ^bar | baz$' style filtering
                                       -- requires telescope-fzf-native, check the readme/wiki

function fuzzyFindFiles()
  builtin.grep_string({
    path_display = { 'smart' },
    only_sort_text = true,
    word_match = "-w",
    search = '',
  })
end


vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope Files" })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope Grep" })
vim.keymap.set('n', '<leader>fg', '<cmd>lua fuzzyFindFiles{}<cr>', { desc = "Telescope Grep" })
vim.keymap.set('n', '<leader>fo', builtin.buffers, { desc = "Telescope Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope Help" })

-- Telescope Project
vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
)

-- Telescope File Browser
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<space>fp",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
-- Telescope Notify
vim.api.nvim_set_keymap(
  "n",
  "<space>fn",
  ":Telescope notify<CR>",
  { noremap = true }
)
