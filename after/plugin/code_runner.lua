require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = {
      "cd $dir &&",
      "python -u $fileName",
    },
    c = function(...)
      local root_dir = require("lspconfig").util.root_pattern "*.c"(vim.loop.cwd())
      return "cd " .. root_dir .. " && mkdir -p out && gcc $fileName -o out/$fileNameWithoutExt && ./out/$fileNameWithoutExt"
    end,
    cpp = function(...)
      local root_dir = require("lspconfig").util.root_pattern "*.cpp"(vim.loop.cwd())
      return "cd $dir && mkdir -p out && g++ -std=c++17 $fileName -o out/$fileNameWithoutExt && ./out/$fileNameWithoutExt"
    end,

    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
    tex = function(...)
      require("code_runner.hooks.preview_pdf").run {
        command = "pdflatex",
        args = { "-output-directory", "/tmp", "$fileName" },
        preview_cmd = "/bin/zathura --fork",
        overwrite_output = "/tmp",
      }
    end,
    markdown = function(...)
      markdownCompileOptions = {
        Normal = "pdf",
        Presentation = "beamer",
      }
      vim.ui.select(vim.tbl_keys(markdownCompileOptions), {
        prompt = "Select preview mode:",
      }, function(opt, _)
        if opt then
          require("code_runner.hooks.preview_pdf").run {
            command = "pandoc",
            args = { "$fileName", "-o", "$tmpFile", "-t", markdownCompileOptions[opt] },
            preview_cmd = "/bin/zathura --fork",
          }
        else
          print "Not Preview"
        end
      end)
    end,
  },
})


-- Remaps

-- vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crp', ':CRProjectsoremap = true, silent = false })
