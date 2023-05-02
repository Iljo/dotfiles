-- LSP

local lspconfig = require('lspconfig')
lspconfig.ltex.setup {
   settings = {
        ltex = {
            language = "en-US"
        }
    },
}
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        print("Attached buffer", args.buf, "to LSP client", args.data.client_id)
        require("ltex_extra").setup {
            load_langs = { "en-US" },
            path = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]) .. "/.spell"
        }
    end
})


-- Use Vim configuration

vim.cmd('source ~/.config/nvim/vimscript-transition.vim')

