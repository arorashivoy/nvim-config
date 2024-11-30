local Terminal = require('toggleterm.terminal').Terminal

function runCodeInTerm()
    -- print(vim.fn.expand('%:p:h'))
    -- print(vim.fn.expand('%:p:t'))
    -- print(vim.fn.expand('%:e'))


    -- Saving the buffer
    vim.api.nvim_command('write')

    -- Python
    if vim.fn.expand('%:e') == 'py' then
        local runPythonCode = Terminal:new({
            cmd = string.format('cd %s && python %s', vim.fn.expand('%:p:h'), vim.fn.expand('%:p:t')),
            hidden = true,
            direction = 'vertical',
            on_open = function(term)
                vim.cmd('startinsert!')
                vim.api.nvim_buf_set_keymap(term.bufnr, 'i', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
                vim.cmd('stopinsert!')
            end,
            on_close = function(term)
                vim.cmd('stopinsert!')
                vim.cmd('normal!')
            end,
            close_on_exit = false,
        })

        runPythonCode:toggle()


        -- C++
    elseif vim.fn.expand('%:e') == 'cpp' then
        local runCppCode = Terminal:new({
            -- cmd = string.format('cd %s && python %s', vim.fn.expAND('%:P:H'), VIM.fn.expand('%:p:t')),
            cmd = string.format('cd %s && mkdir -p out && g++ -std=c++17 %s -o ./out/%s && ./out/%s',
                vim.fn.expand('%:p:h'), vim.fn.expand('%:p:t'), vim.fn.expand('%:p:t:r'), vim.fn.expand('%:p:t:r')),
            hidden = true,
            direction = 'vertical',
            on_open = function(term)
                vim.cmd('startinsert!')
                vim.api.nvim_buf_set_keymap(term.bufnr, 'i', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
                vim.cmd('stopinsert!')
            end,
            on_close = function(term)
                vim.cmd('stopinsert!')
            end,
            close_on_exit = false,
        })

        runCppCode:toggle()

        -- C
    elseif vim.fn.expand('%:e') == 'c' then
        local runCppCode = Terminal:new({
            cmd = string.format('cd %s && mkdir -p out && gcc %s -o ./out/%s && ./out/%s', vim.fn.expand('%:p:h'),
                vim.fn.expand('%:p:t'), vim.fn.expand('%:p:t:r'), vim.fn.expand('%:p:t:r')),
            hidden = true,
            direction = 'vertical',
            on_open = function(term)
                vim.cmd('startinsert!')
                vim.api.nvim_buf_set_keymap(term.bufnr, 'i', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
                vim.cmd('stopinsert!')
            end,
            on_close = function(term)
                vim.cmd('stopinsert!')
            end,
            close_on_exit = false,
        })

        runCppCode:toggle()

        -- Haskell
    elseif vim.fn.expand('%:e') == 'hs' then
        local runCppCode = Terminal:new({
            -- Run normal haskell files
            -- cmd = string.format('cd %s && mkdir -p out && ghc %s -o ./out/%s && ./out/%s', vim.fn.expand('%:p:h'), vim.fn.expand('%:p:t'), vim.fn.expand('%:p:t:r'), vim.fn.expand('%:p:t:r')),

            -- Running the test files for haskell mooc course
            cmd = string.format('cd %s && stack runhaskell %sTest.hs', vim.fn.expand('%:p:h'),vim.fn.expand('%:p:t:r')),
            hidden = true,
            direction = 'vertical',
            on_open = function(term)
                vim.cmd('startinsert!')
                vim.api.nvim_buf_set_keymap(term.bufnr, 'i', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<C-c>', '<cmd>close<CR>', { noremap = true, silent = true })
                vim.cmd('stopinsert!')
            end,
            on_close = function(term)
                vim.cmd('stopinsert!')
            end,
            close_on_exit = false,
        })

        runCppCode:toggle()
    else
        print(vim.fn.expand('%:p:h'))   -- print file location
        print(vim.fn.expand('%:p:t:r')) -- print file name without extension
        print(vim.fn.expand('%:p:t'))   -- print file name with extension
        print(vim.fn.expand('%:e'))     -- print file extension
    end
end

-- Keymaps
vim.keymap.set('n', '<M-r>', '<cmd>lua runCodeInTerm()<CR>',
    { noremap = true, silent = true, desc = 'Run code in terminal' })
