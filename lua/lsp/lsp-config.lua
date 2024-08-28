-- Mason setup
require('mason').setup()

-- Mason LSPConfig setup
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",         -- Lua
        "pyright",        -- Python
        "tsserver",       -- TypeScript/JavaScript
        "gopls",          -- Go
        "rust_analyzer",  -- Rust
        "phpactor",       -- PHP
        "intelephense",   -- Another popular PHP LSP
        "volar",          -- Vue
        "tailwindcss",    -- Tailwind CSS
        "emmet_ls",       -- For HTML including HTMX
        "sqlls",          -- MySQL (SQL Language Server)
    }, -- Add other LSPs you need
})

-- LSP Config
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    -- Your keybindings for LSP here
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Space>s', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    -- More keybinds for LSP...
end

-- Lua LSP
lspconfig.lua_ls.setup {
    on_attach = on_attach,
}

-- Pyright LSP
lspconfig.pyright.setup {
    on_attach = on_attach,
}

-- TSServer LSP (JavaScript/TypeScript)
lspconfig.tsserver.setup {
    on_attach = on_attach,
}

-- Go LSP
lspconfig.gopls.setup {
    on_attach = on_attach,
}

-- Rust LSP
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
}

-- PHP LSP (phpactor)
lspconfig.phpactor.setup {
    on_attach = on_attach,
}

-- PHP LSP (Intelephense) - optional, can be used instead of or alongside phpactor
lspconfig.intelephense.setup {
    on_attach = on_attach,
}

-- Vue.js LSP
lspconfig.volar.setup {
    on_attach = on_attach,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
}

-- Tailwind CSS LSP
lspconfig.tailwindcss.setup {
    on_attach = on_attach,
}

-- HTML, HTMX, and other related technologies (using Emmet)
lspconfig.emmet_ls.setup {
    on_attach = on_attach,
    filetypes = { 'html', 'css', 'javascript', 'typescript', 'htmx' },
}

-- MySQL (SQL Language Server)
lspconfig.sqlls.setup {
    on_attach = on_attach,
}























































