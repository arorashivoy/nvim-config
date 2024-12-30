require("toggleterm").setup {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,    -- hide the number column in toggleterm buffers
    autochdir = false,      -- when neovim changes it current directory the terminal will change it's own when next it's opened
    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    close_on_exit = true,   -- close the terminal window when the process exits
    direction = 'vertical', -- | 'horizontal' | 'window' | 'float',
    -- Change the default shell. Can be a string or a function returning a string
    shell = vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    },
}

-- Custom Terminals
local Terminal = require('toggleterm.terminal').Terminal


-- Lazygit
local lazygit  = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    on_open = function(term)
        vim.cmd('startinsert!')
        vim.api.nvim_buf_set_keymap(term.bufnr, 'i', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
    end,
    on_close = function(term)
        vim.cmd('stopinsert!')
    end,
})

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>",
    { noremap = true, silent = true, desc = "Create lazygit Terminal" })

-- Floating Terminal
local floatingTerm = Terminal:new({
    hidden = true,
    direction = "float",
    on_open = function(term)
        vim.cmd('startinsert!')
        vim.api.nvim_buf_set_keymap(term.bufnr, 'i', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
    end,
    on_close = function(term)
        vim.cmd('stopinsert!')
    end,
})

function _floatingTerm_toggle()
    floatingTerm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>lua _floatingTerm_toggle()<CR>",
    { noremap = true, silent = true, desc = "Create floatingTerm Terminal" })

vim.keymap.set("n", "<c-/>", ":ToggleTerm dir=%:p:h<CR>")
