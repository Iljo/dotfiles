-- LSP

local lspconfig = require('lspconfig')
lspconfig.ltex.setup{
   settings = {
        ltex = {
            language = "en-US"
        }
    },
}
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        print("Attached buffer", args.buf, "to LSP client", args.data.client_id)
    end
})


-- Use Vim configuration

vim.cmd('source ~/.config/nvim/vimscript-transition.vim')

