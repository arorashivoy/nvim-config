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
            image = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            bufdelete = { enabled = true },
            dashboard = {
                sections = {
                    { section = "header" },
                    -- {
                    --     pane = 2,
                    --     section = "terminal",
                    --     cmd = "colorscript -e square",
                    --     height = 5,
                    --     padding = 1,
                    -- },
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

    ---------
    -- LSP --
    ---------
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.sourcekit.setup {
                cmd = { "xcrun", "sourcekit-lsp" },
                filetypes = { "swift", "objective-c", "objective-cpp" },
                root_dir = require('lspconfig.util').root_pattern("Package.swift", ".git"),
                capabilities = capabilities,
            }
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
            lspconfig.solargraph.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP goto definition" })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP goto reference" })
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
            vim.keymap.set("n", "gf", vim.lsp.buf.format, { desc = "Format current buffer" })
        end,
    },

    -- Dap (Debug Adapter Protocol)
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "wojciech-kulik/xcodebuild.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local xcodebuild = require("xcodebuild.integrations.dap")

            local codelldbPath = os.getenv("HOME") .. "/.tools/codelldb-darwin-arm64/extension/adapter/codelldb"

            dapui.setup()
            xcodebuild.setup(codelldbPath)

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
        end,

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

    -- Surround
    "tpope/vim-surround",

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

    ------------------------------
    -- Xcode integration plugin --
    ------------------------------
    {
        "wojciech-kulik/xcodebuild.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "MunifTanjim/nui.nvim",
        },
        integrations = {
            xcodebuild_offline = {
                enabled = true,
            },
        },
        config = function()
            require("xcodebuild").setup({
                code_coverage = {
                    enabled = true,
                },
                pymobiledevice = {
                    enabled = true,
                },
                xcodebuild_offline = {
                    enabled = true,
                },
            })

            vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
            vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
            vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
            vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
            vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
            vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
            vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
            vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
            vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
            vim.keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>",
                { desc = "Show Code Coverage Report" })
            vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })
            vim.keymap.set("n", "<leader>xs", "<cmd>XcodebuildSetup<cr>", { desc = "Setup Xcodebuild Setup" })
            vim.keymap.set("n", "<leader>xh", "<cmd>XcodebuildPreviewGenerateAndShow hotReload<cr>",
                { desc = "Generate & Show Hot Reload Preview" })
        end,
    },

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
