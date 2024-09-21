vim.cmd(
[[
function! OpenMarkdownPreview (url)
  execute "silent ! chrome --new-window --app=" . a:url
endfunction
]]
)

-- vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
vim.g.mkdp_browserfunc = ''
