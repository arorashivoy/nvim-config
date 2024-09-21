local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

-- Setting up cmp
local cmp = require('cmp')
local types = require('cmp.types')

cmp.setup({
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        -- { name = 'copilot' },
        { name = 'luasnip' },
    },
    -- cmp.mapping.preset = {}
    mapping = {
      ['<Down>'] = {i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),},
      ['<Up>'] = {i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),},
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.config.disable,
      ['<tab>'] = cmp.config.disable,
      ['<S-Tab>'] = cmp.config.disable,
      ['<S-tab>'] = cmp.config.disable,
    },
})

local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}


-- -- Disabling warnings
-- " LSP settings
-- " log file location: /Users/arorashivoy/.local/share/nvim/vim-lsp.log
-- :lua << EOF
--   -- Add nvim-lspconfig plugin
--   local on_attach = function(_, bufnr)
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--       vim.lsp.diagnostic.on_publish_diagnostics, {
--         -- disable virtual text
--         virtual_text = false,
--
--         -- show signs
--         signs = true,
--
--         -- delay update diagnostics
--         update_in_insert = false,
--       }
--     )
-- EOF


vim.cmd([[
" LSP settings
" log file location: /Users/michael/.local/share/nvim/vim-lsp.log
:lua << EOF
  -- Add nvim-lspconfig plugin
  local on_attach = function(_, bufnr)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = false,

        -- show signs
        signs = true,

        -- delay update diagnostics
        update_in_insert = false,
    }
    )
end

EOF
]])
