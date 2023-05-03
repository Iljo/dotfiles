-- LSP

local git_dirname = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]) 
local lspconfig = require('lspconfig')

lspconfig.ltex.setup {
    settings = {
        ltex = {
            language = "en-US"
        }
    },
    on_attach = function(client, bufnr) 
        require("ltex_extra").setup {
            load_langs = { "en-US" },
            path = (git_dirname or "~") .. "/.spell"
        }
    end
}
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        print("Attached buffer", args.buf, "to LSP client", args.data.client_id)
    end
})


-- Use Vim configuration

vim.cmd('source ~/.config/nvim/vimscript-transition.vim')

