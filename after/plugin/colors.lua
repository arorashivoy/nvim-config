-- OneDark theme
require('onedark').setup {
    style = 'dark',
   transparent = true,
}

require('onedark').load()


-- require('catppuccin').setup({
--     flavour = "mocha",
--     transparent_background = true,
-- })

function ColorMyPencils(color)
    color = color or "onedark"
    -- color = color or "catppuccin"

    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Vim Jukit Color scheme
    vim.cmd("highlight jukit_cellmarker_colors guifg=#1d615a guibg=#1d615a ctermbg=22 ctermfg=22")
end

ColorMyPencils()
--

