
local dap = require('dap')
local dap_python = require('dap-python')
local dap_project = require('nvim-dap-projects')
local wk = require('which-key')
local dapui = require "dapui"

dap_project.config_paths = { './nvim-dap.lua' }
dap_project.search_project_config()

dap_python.setup('~/.config/nvim/.virtualenvs/debugpy/bin/python')
dap_python.test_runner = 'pytest'


local opts = { noremap = true, silent = true, prefix = '<leader>', mode = {'n', 'v'} }

local mapping = {
    d = {
        name = 'Debug',
        b = { dap.toggle_breakpoint, 'Toggle Breakpoint' },
        c = { dap.continue, 'Continue' },
        o = { dap.step_over, 'Step Over' },
        i = { dap.step_into, 'Step Into' },
        O = { dap.step_out, 'Step Out' },
        q = { dapui.close, 'Terminate Dap Ui' },
        u = { dapui.toggle, 'Open Dap Ui' },
        m = { dap_python.test_method, 'Test Method' },
        k = { dap_python.test_class, 'Test Class' },
        s = { dap_python.debug_selection, 'Debug Selection' },
    },
}
wk.register(mapping, opts)

opts = {noremap = true, silent = true}

-- short keymaps
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, opts)

-- ui
dapui.setup {} -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

