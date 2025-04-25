require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)

-- In windows it is faster to use the clangd from LLVM directly
-- require("lspconfig").clangd.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.semanticTokensProvider = nil
--     local default_on_attach = require("nvchad.configs.lspconfig").on_attach
--     if default_on_attach then
--       default_on_attach(client, bufnr)
--     end
--   end,
--   capabilities = require("nvchad.configs.lspconfig").capabilities,
-- }
