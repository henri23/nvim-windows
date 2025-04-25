require "nvchad.options"

local o = vim.o
o.cursorlineopt = 'both' -- to enable cursorline!

local set = vim.opt     -- set options

set.number = false
set.colorcolumn="80"

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.bo.commentstring = "// %s"
		vim.o.expandtab = false
		vim.o.tabstop = 4
		vim.o.shiftwidth = 4
		vim.o.softtabstop = 0
		vim.o.smarttab = true
		vim.o.autoindent = true
		vim.o.smartindent = true
		vim.o.cinoptions = ":0,l1,g0,(0,W4,m1"
    end,
})
