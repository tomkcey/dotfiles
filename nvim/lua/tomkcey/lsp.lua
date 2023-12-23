local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({ 'tsserver', 'rust_analyzer', 'gopls' })

lsp.on_attach(function(client)
  print(client.name)
end)

lsp.setup()