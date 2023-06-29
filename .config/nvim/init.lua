----------------
-- Diagnostic --
----------------

vim.diagnostic.config({ 
    virtual_text = false,
    update_in_insert = false
})

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<F25>', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


---------
-- LSP --
---------

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
            --       Update: path could also be relative, but it doesn't work for me, I always get
            --       current working directory for the path. In fs.lua path funtion, root dir should
            --       be calculated like this maybe:
            --       require("lspconfig").ltex.get_root_dir(vim.api.nvim_buf_get_name(0))
            path = git_dirname_or_home(vim.api.nvim_buf_get_name(bufnr)) .. "/.spell/ltex" 
        }
    end
}
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        print("Attached buffer", args.buf, "to LSP client", args.data.client_id)

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = args.buf }
        vim.keymap.set({ 'n', 'v' }, '<M-CR>', vim.lsp.buf.code_action, opts)
    end
})


---------------------------
-- Use Vim configuration --
---------------------------

vim.cmd('source ~/.config/nvim/vimscript-transition.vim')

