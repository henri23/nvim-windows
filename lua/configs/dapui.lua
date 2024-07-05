local dap, dapui = require "dap", require "dapui"
if not dap then
  return
end

if not dapui then
  return
end

local codelldb = require("mason-registry").get_package "codelldb"
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = codelldb_path,
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\bin\\", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.c = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\bin\\", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
dapui.setup()

-- require("netcoredbg-macOS-arm64").setup(dap)
require("nvim-dap-virtual-text").setup()
require("dap-go").setup()

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "DAP Toggle breakpoint" })
-- vim.keymap.set("n", "<leader>db", require("dapui").open(), { desc = "Toggle UI" })
vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Run debugger" })
vim.keymap.set("n", "<F1>", dap.step_over, { desc = "DAP Step over" })
vim.keymap.set("n", "<F2>", dap.step_into, { desc = "DAP Step into" })
vim.keymap.set("n", "<F3>", dap.step_out, { desc = "DAP Step out" })
vim.keymap.set("n", "<F4>", dap.step_back, { desc = "DAP Step back" })
vim.keymap.set("n", "<F12>", dap.restart, { desc = "DAP Restart" })
vim.keymap.set("n", "<space>?", function()
  require("dapui").eval(nil, { enter = true })
end)
vim.keymap.set("n", "<S-F1>", function()
  -- require("dapui").disconnect { terminateDebuggee = true }
  require("dapui").open()
end)
vim.keymap.set("n", "<S-F5>", function()
  require("dapui").close()
  require("dap").terminate()
end)

vim.fn.sign_define("DapBreakpoint", { text = "󰀘 ", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
