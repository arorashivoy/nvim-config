-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-A>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.g.copilot_assume_mapped = true

-- require("copilot").setup()
-- require("copilot").setup({
--   suggestion = { enabled = false },
--   panel = { enabled = false },
-- })
-- require('copilot').setup({
--   panel = {
--     enabled = true,
--     auto_refresh = false,
--     keymap = {
--       jump_prev = "[[",
--       jump_next = "]]",
--       accept = "<CR>",
--       refresh = "gr",
--       open = "<M-CR>"
--     },
--     layout = {
--       position = "bottom", -- | top | left | right
--       ratio = 0.4
--     },
--   },
--   suggestion = {
--     enabled = true,
--     auto_trigger = false,
--     debounce = 75,
--     keymap = {
--       accept = "<M-l>",
--       accept_word = false,
--       accept_line = false,
--       next = "<M-]>",
--       prev = "<M-[>",
--       dismiss = "<C-]>",
--     },
--   },
--   filetypes = {
--     yaml = false,
--     markdown = false,
--     help = false,
--     gitcommit = false,
--     gitrebase = false,
--     hgcommit = false,
--     svn = false,
--     cvs = false,
--     ["."] = false,
--   },
--   copilot_node_command = 'node', -- Node.js version must be > 16.x
--   server_opts_overrides = {},
-- })


-- vim.g.copilot_filetypes = {
--   ["*"] = false,
--   ["javascript"] = true,
--   ["typescript"] = true,
--   ["lua"] = false,
--   ["rust"] = true,
--   ["c"] = true,
--   ["c#"] = true,
--   ["c++"] = true,
--   ["go"] = true,
-- }
