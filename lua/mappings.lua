require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>ee", "<cmd> NvimTreeToggle <cr>", { desc = "Nvimtree Toggle tree" })
map("i", "jk", "<ESC>")
map("n", "<leader>ta", function()
    vim.x = not vim.x
    require("cmp").setup { enabled = not vim.x }
end, { desc = "Toggle Autocompletion CMP" })
map({"n", "t"}, "<F10>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts = {
        border = "single"
    } }
end, { desc = "Toggle Floating terminal" })

local opts = { buffer = bufnr, noremap = true, silent = true }

map("n", "<F7>", ":RunCode<CR>", { desc = "Coderunner Run Code" })
map('n', 'gD', vim.lsp.buf.declaration, { desc = "LSP Go to declaration" }, opts)
map('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Go to definition" }, opts)
map('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover" }, opts)
map('n', 'gi', vim.lsp.buf.implementation,  { desc = "LSP Go to implementation" },opts)
map('n', '<C-k>', vim.lsp.buf.signature_help,  { desc = "LSP Signature help" },opts)
map('n', '<space>wa', vim.lsp.buf.add_workspace_folder,  { desc = "LSP Add workspace folder" },opts)
map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,  { desc = "LSP Remove workspace folder" },opts)
map('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
map('n', '<space>D', vim.lsp.buf.type_definition,  { desc = "LSP Type definition" },opts)
map('n', '<space>rn', vim.lsp.buf.rename,  { desc = "LSP Rename buffer" },opts)
map('n', 'gr', vim.lsp.buf.references,  { desc = "LSP Go to references" },opts)
map('n', '<space>e', vim.diagnostic.open_float,  { desc = "LSP Open float" },opts)
map('n', '[d', vim.diagnostic.goto_prev,  { desc = "LSP Go to prev" },opts)
map('n', ']d', vim.diagnostic.goto_next,  { desc = "LSP Go to next" },opts)
map('n', '<space>q', vim.diagnostic.setloclist,  { desc = "LSP Set Lock list" },opts)
