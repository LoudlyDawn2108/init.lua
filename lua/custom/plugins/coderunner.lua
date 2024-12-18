return {
  'CRAG666/code_runner.nvim',
  dependencies = { 'preservim/vimux' },
  config = function()
    vim.keymap.set('n', '<leader>e', ':RunCode<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })

    require('code_runner').setup {
      mode = 'better_term',
      better_term = {
        number = 2,
      },
      filetype = {
        javascript = 'node',
        java = 'cd $dir && javac $fileName && java $fileNameWithoutExt',
        kotlin = 'cd $dir && kotlinc-native $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt.kexe',
        c = 'cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt',
        cpp = {
          'cd $dir &&',
          'g++ $fileName',
          '-o /tmp/$fileNameWithoutExt &&',
          '/tmp/$fileNameWithoutExt',
        },
        python = "python -u '$dir/$fileName'",
        sh = 'bash',
        typescript = 'deno run',
        typescriptreact = 'yarn dev$end',
        rust = 'cd $dir && rustc $fileName && $dir$fileNameWithoutExt',
        dart = 'dart',
      },
    }
  end,
}
