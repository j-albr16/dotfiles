local term = require("toggleterm")

local config = {
    direction = 'horizontal',
    size = 20,
    persist_size = true,
    start_in_insert = true,
    shading_factor = 2,
}


term.setup(config)

local Terminal = require('toggleterm.terminal').Terminal

python = Terminal:new({ cmd = 'python3', hidden = true, direction = 'float' })

function _PYTHON_TOGGLE()
    python:toggle()
end

function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

function on_create(t)
    venv_path = vim.fn.getcwd() .. '/venv'
    has_virtualenv = io.open(venv_path)
    if has_virtualenv ~= nil then
        t:send(". venv/bin/activate && clear")
    end
end

horizontal1 = Terminal:new({ cmd = vim.o.shell, on_create = on_create, hidden = true, direction = 'horizontal' })
horizontal2 = Terminal:new({ cmd = vim.o.shell, on_create = on_create, hidden = true, direction = 'horizontal' })
horizontal3 = Terminal:new({ cmd = vim.o.shell, on_create = on_create, hidden = true, direction = 'horizontal' })
horizontal4 = Terminal:new({ cmd = vim.o.shell, on_create = on_create, hidden = true, direction = 'horizontal' })



vim.keymap.set('t', '<C-e>', '<C-\\><C-n>', { silent = true })
vim.keymap.set({ "n", 't' }, '<C-n>', '<cmd>lua horizontal1:toggle()<CR>', { silent = true })
