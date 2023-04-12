vim.lsp.start({
  name = 'LTeX Language Server',
  cmd = {'ltex-ls'},
  root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
})

vim.cmd('source ~/.config/nvim/vimscript-transition.vim')

