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
-- I need a way to toggle the nvim tree
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
