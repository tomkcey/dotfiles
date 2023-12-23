local null_ls = require('null-ls')

local g = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
    sources = { null_ls.builtins.formatting.prettier },
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = g, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = g,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(c)
                            return c.name == 'null-ls'
                        end
                    })
                end
            })
        end
    end
})