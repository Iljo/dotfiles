-- LSP

local git_dirname = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]) 
local language_identifiers = {"html", "tex", "latex", "markdown", "gitcommit"}

local lspconfig = require('lspconfig')
lspconfig.ltex.setup {
    autostart = false,
    filetypes = language_identifiers,
    settings = {
        ltex = {
            language = "en-US",
            enabled = language_identifiers,
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

