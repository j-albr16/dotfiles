local lspconfig = require('lspconfig')
lspconfig.solargraph.setup({init_options = {formatting = true}})

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>dl', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>dh', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>p', function() 
        print("formatting")
        vim.lsp.buf.format { async = true} 
    end, opts)
end

lspconfig.pylsp.setup({
    on_attach = on_attach,
})

local lsp_servers = {
    'pylsp',
    'lua_ls',
    'rust_analyzer',
    'tsserver',
    'html',
    'yamlls'
}


local mason = require('mason')
local mason_lsp = require('mason-lspconfig')

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lsp.setup({
  ensure_installed = lsp_servers,
})


