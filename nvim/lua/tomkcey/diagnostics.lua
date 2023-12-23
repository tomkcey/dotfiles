local opts = { silent = true, noremap = true }

vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', opts)
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle lsp_references<cr>', opts)