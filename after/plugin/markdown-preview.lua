vim.cmd(
[[
function! OpenMarkdownPreview (url)
  echo "Opening URL: " . a:url
  execute "silent ! open -a Safari " . a:url
endfunction
]]
)

-- vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
vim.g.mkdp_browserfunc = ''
