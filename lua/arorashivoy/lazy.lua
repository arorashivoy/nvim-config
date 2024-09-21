local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- Plugins
require("lazy").setup({

    -- default lazy plugins
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            plugins = {
                spelling = {
                    enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
            },
        },
    },

    {
        "folke/neoconf.nvim",
        cmd = "Neoconf"
    },
    "folke/neodev.nvim",

    -- Themes
    'navarasu/onedark.nvim',
    -- 'martinsione/darkplus.nvim',
    { "catppuccin/nvim",                          name = "catppuccin" },


    --------------------------
    -- Telescope Extensions --
    --------------------------
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    -- Telescope File Browser
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    -- Telescope BibTeX
    "nvim-telescope/telescope-bibtex.nvim",
    -- Telescope Project
    'nvim-telescope/telescope-project.nvim',
    -- Devicons for Telescope File Browser
    'nvim-tree/nvim-web-devicons',
    -- Telescope Fuzzy Find
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },


    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
    'nvim-treesitter/playground',
    "nvim-treesitter/nvim-treesitter-context",

    -- Harpoon
    'ThePrimeagen/harpoon',

    -- UndoTree
    'mbbill/undotree',

    -- -- Git
    -- 'tpope/vim-fugitive',
    -- 'tpope/vim-rhubarb',

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'hrsh7th/nvim-cmp' },     -- Required
        }
    },

    -- Git Signs
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
                    { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
                    { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
                vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = '[P]review [H]unk' })
            end,
        },
    },

    -- Status bar Line
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    -- Indetation Guide
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Jupyter Notebook
    'luk400/vim-jukit',

    -- Copilot
    'github/copilot.vim',
    -- { "zbirenbaum/copilot.lua" },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken",    -- Only on MacOS or Linux
        opts = {
            debug = true,           -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
    },

    -- Todo Comments highlight
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    -- Comment selections
    'numToStr/Comment.nvim',

    -- Code Runner
    { "CRAG666/code_runner.nvim",            config = true },

    -- Vim-Tmux Navigator
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },

    -- Custom Snippets
    { 'saadparwaiz1/cmp_luasnip' },
    { "rafamadriz/friendly-snippets" },

    -- Notify
    {
        'rcarriga/nvim-notify',
        opts = {
            -- other stuff
            background_colour = "#000000"
        },
    },


    -- vim-illuminator
    'RRethy/vim-illuminate',

    -- Live preview of Makrdown and Latex
    'frabjous/knap',

    -- Mini plugins
    {
        'echasnovski/mini.nvim',
        version = false
    },

    -- Toggle Term
    { 'akinsho/toggleterm.nvim', version = "*", config = true },

    -- Autosave
    'tmillr/sos.nvim',

    -- Refactoring
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },

    -- Leetcode.nvim
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
            arg = "leetcode.nvim",
            lang = "cpp",
        },
    },

    -- Toggle Diagnostics of LSP
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',

    -- -- flash (enhanxcing the search)
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     ---@type Flash.Config
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    --         { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    --         { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    --         { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --         { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    --     },
    -- },
})
