require("mason").setup()
require("mason-nvim-dap").setup({ automatic_setup = true })

local dap = require("dap")
local widgets = require("dap.ui.widgets")
local sidebar = widgets.sidebar(widgets.scopes)

dap.listeners.after.event_initialized["sidebar"] = function()
  sidebar.open()
end
dap.listeners.before.event_terminated["sidebar"] = function()
  sidebar.close()
end
dap.listeners.before.event_exited["sidebar"] = function()
  sidebar.close()
end

local dap_python = require("dap-python")
dap_python.setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')

table.insert(dap.configurations.python, {
  type = 'python';
  request = 'attach';
  name = 'Attach remote (path mapping)';
  connect = function()
    local host = vim.fn.input('Host [127.0.0.1]: ')
    host = host ~= '' and host or '127.0.0.1'
    local port = tonumber(vim.fn.input('Port [5678]: ')) or 5678
    return { host = host, port = port }
  end;
  pathMappings = function()
    local cwd = '${workspaceFolder}'
    local local_path = vim.fn.input('Local path mapping [' .. cwd .. ']: ')
    local_path = local_path ~= '' and local_path or cwd
    local remote_path = vim.fn.input('Remote path mapping [.]: ')
    remote_path = remote_path ~= '' and remote_path or '.'
    return {{ localRoot = local_path, remoteRoot = remote_path }, }
  end
})

local function add_conditional_breakpoint()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dB", add_conditional_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dt", dap_python.test_method)
vim.keymap.set("n", "<leader>dC", dap.run_to_cursor)
vim.keymap.set("n", "<leader>ds", dap.step_into)
vim.keymap.set("n", "<leader>dn", dap.step_over)
vim.keymap.set("n", "<leader>du", dap.up)
vim.keymap.set("n", "<leader>dd", dap.down)
vim.keymap.set("n", "<leader>dK", widgets.hover)
vim.keymap.set('n', '<leader>df', require'telescope'.extensions.dap.frames, {})
vim.keymap.set('n', '<leader>dr', dap.repl.open)
vim.keymap.set('n', '<leader>dl', require'dap.ext.vscode'.load_launchjs)
