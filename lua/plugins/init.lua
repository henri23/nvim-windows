return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "telescope")
            local telescope = require "telescope"
            telescope.setup(opts)
            -- load extensions
            for _, ext in ipairs(opts.extensions_list) do
                telescope.load_extension(ext)
            end

            local keymap = vim.keymap -- for conciseness
            keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Telescope Find todos" })
        end,
    },
    {
        "CRAG666/code_runner.nvim",
        event = "VeryLazy",
        config = function()
            require "configs.coderunner"
        end,
    },
    {
        "github/copilot.vim",
        event = "VeryLazy",
    },
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
        },
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo_comments = require "todo-comments"

            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "]t", function()
                todo_comments.jump_next()
            end, { desc = "Next todo comment" })

            keymap.set("n", "[t", function()
                todo_comments.jump_prev()
            end, { desc = "Previous todo comment" })

            todo_comments.setup()
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Trouble Diagnostics",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Trouble Buffer Diagnostics",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Trouble Symbols",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "Trouble LSP Definitions / references",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Trouble Location List",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Trouble Quickfix List",
            },
        },
        opts = {},
    },
    {
        "szw/vim-maximizer",
        opts = {},
        keys = {
            { "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Maximizer Maximize Split" },
        },
        config = function() end,
    },

    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },
    {

        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            routes = {
                filter = { event = "notify", find = "No information available" },
                opts = { skip = true },
            },
            presets = { lsp_doc_border = false },
            lsp = {

                hover = {
                    enabled = false,
                },
                signature = {
                    enabled = false,
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
        },
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    },
    {
        "rcarriga/nvim-notify",
        event = "InsertEnter",
        opts = {
            background_colour = "#000000",
        },
        config = function()
            vim.notify = require("notify").setup {
                background_colour = "#000000",
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "leoluz/nvim-dap-go",
        },
        event = "VeryLazy",
        config = function()
            require "configs.dapui"
        end,
    },
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
        config = function()
            vim.keymap.set(
                "n",
                "<leader>m",
                "<cmd>lua require('harpoon.mark').add_file()<cr>",
                { desc = "Harpoon Add file" }
            )

            vim.keymap.set(
                "n",
                "<leader>ht",
                "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
                { desc = "Harpoon Toggle harpoon" }
            )

            vim.keymap.set("n", "<leader>hm", ":Telescope harpoon marks<cr>", { desc = "Harpoon Harpoon Marks" })
        end,
    },
    {
        "jayp0521/mason-nvim-dap.nvim",
        requires = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
        opts = {
            handlers = {},
            ensure_installed = {
                "codelldb",
            },
        },
        event = "BufRead",
        config = function()
            require "configs.mason_dap"
        end,
    },

    -- These are some examples, uncomment them if you want to see them work!
    -- {
    --   "neovim/nvim-lspconfig",
    --   config = function()
    --     require("nvchad.configs.lspconfig").defaults()
    --     require "configs.lspconfig"
    --   end,
    -- },
    --
    -- {
    -- 	"williamboman/mason.nvim",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"lua-language-server", "stylua",
    -- 			"html-lsp", "css-lsp" , "prettier"
    -- 		},
    -- 	},
    -- },
    --
    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
