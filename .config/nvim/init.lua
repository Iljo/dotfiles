-- LSP

function git_dirname_or_home(startpath)
    git_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true, limit = 1, path = startpath})[1])
    return git_dir or os.getenv('HOME')
end

local language_identifiers = {"html", "tex", "latex", "markdown", "gitcommit", "text"}

local lspconfig = require('lspconfig')
lspconfig.ltex.setup {
    root_dir = git_dirname_or_home,
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
            -- FIXME Why does ltex_extra use path only from first buffer on which it was set up.
            --       Looks like it uses relative path, but still...
            --       https://github.com/barreiroleo/ltex_extra.nvim/blob/3ceb2401ab70c132305b3dba4dcb418d97b567ad/lua/ltex_extra/init.lua#L7
            --       Maybe this variable should be changed to function
            --       https://github.com/barreiroleo/ltex_extra.nvim/blob/3ceb2401ab70c132305b3dba4dcb418d97b567ad/lua/ltex_extra/utils/fs.lua#L2
            path = git_dirname_or_home(vim.api.nvim_buf_get_name(bufnr)) .. "/.spell/ltex" 
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

