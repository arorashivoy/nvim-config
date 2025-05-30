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

    -- Snack
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            bufdelete = { enabled = true },
            dashboard = {
                sections = {
                    { section = "header" },
                    {
                        pane = 2,
                        section = "terminal",
                        cmd = "colorscript -e square",
                        height = 5,
                        padding = 1,
                    },
                    { section = "keys", gap = 1, padding = 1 },
                    { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    -- {
                    --   pane = 2,
                    --   icon = " ",
                    --   title = "Git Status",
                    --   section = "terminal",
                    --   -- enabled = Snacks.git.get_root() ~= nil,
                    --   cmd = "hub status --short --branch --renames",
                    --   height = 5,
                    --   padding = 1,
                    --   ttl = 5 * 60,
                    --   indent = 3,
                    -- },
                    { section = "startup" },
                },
            },
        },
    },

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

    -- {
    --     "folke/neoconf.nvim",
    --     cmd = "Neoconf"
    -- },

    -- Themes
    'navarasu/onedark.nvim',
    -- 'martinsione/darkplus.nvim',
    -- { "catppuccin/nvim",                          name = "catppuccin" },


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
    -- -- Telescope Project
    -- 'nvim-telescope/telescope-project.nvim',
    -- Devicons for Telescope File Browser
    'nvim-tree/nvim-web-devicons',
    -- -- Telescope Fuzzy Find
    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },


    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",     build = ":TSUpdate" },

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
            max_file_length = 4000,
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
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",       opts = {} },

    -- Jupyter Notebook
    'luk400/vim-jukit',

    -- Copilot
    'github/copilot.vim',
    -- { "zbirenbaum/copilot.lua" },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        -- branch = "master",
        dependencies = {
            { "github/copilot.vim" },    -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken",         -- Only on MacOS or Linux
        opts = {
            debug = true,                -- Enable debugging
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
    -- { "CRAG666/code_runner.nvim",            config = true },

    -- Vim-Tmux Navigator
    -- {
    --     'christoomey/vim-tmux-navigator',
    --     lazy = false,
    -- },

    -- Custom Snippets
    -- { 'saadparwaiz1/cmp_luasnip' },
    -- { "rafamadriz/friendly-snippets" },

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

    -- -- Live preview of Makrdown and Latex
    -- 'frabjous/knap',
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_theme = "light"
        end,
        ft = { "markdown" },
    },

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

    -- -- Leetcode.nvim
    -- {
    --     "kawre/leetcode.nvim",
    --     build = ":TSUpdate html",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-telescope/telescope.nvim",
    --         "nvim-lua/plenary.nvim", -- required by telescope
    --         "MunifTanjim/nui.nvim",
    --
    --         -- optional
    --         "rcarriga/nvim-notify",
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     opts = {
    --         -- configuration goes here
    --         arg = "leetcode.nvim",
    --         lang = "cpp",
    --     },
    -- },

    -- -- Disable plugins for large files
    -- {
    --     "LunarVim/bigfile.nvim",
    --     event = "BufRead",
    --     opts = {
    --         -- Disable the plugin for files larger than 2MB
    --         filesize = 2,
    --     },
    --     config = function(_, opts)
    --         require("bigfile").setup(opts)
    --     end,
    -- },

})
