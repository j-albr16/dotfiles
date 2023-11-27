
local term = require("toggleterm")

local config = {
  direction = 'horizontal',
  size = 20,
  persist_size = true,
  start_in_insert = false,
  shading_factor = 2,
}


term.setup(config)

local Terminal = require('toggleterm.terminal').Terminal

python = Terminal:new({cmd='python3', hidden = true, direction = 'float'})

function _PYTHON_TOGGLE()
 python:toggle()
end
function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function on_create(t)
    venv_path = vim.fn.getcwd() .. '/venv'
    has_virtualenv = io.open(venv_path)
    if has_virtualenv ~= nil then
        t:send(". venv/bin/activate")
    end
end

horizontal1 = Terminal:new({cmd=vim.o.shell, on_create=on_create, hidden = true, direction = 'horizontal'})
horizontal2 = Terminal:new({cmd=vim.o.shell, on_create=on_create,  hidden = true, direction = 'horizontal'})
horizontal3 = Terminal:new({cmd=vim.o.shell, on_create=on_create, hidden = true, direction = 'horizontal'})
horizontal4 = Terminal:new({cmd=vim.o.shell, on_create=on_create, hidden = true, direction = 'horizontal'})

local wk = require('which-key')
local opts = { noremap = true, silent = true, prefix = '', mode = {'n', 'v'}}
local mapping = {
    t = {
        name = 'Terminal',
        p = { '<cmd>lua _PYTHON_TOGGLE()<CR>', 'Python' },
        h = { '<cmd>lua horizontal1:toggle()<CR>', 'Horizontal 1' },
        j = { '<cmd>lua horizontal2:toggle()<CR>', 'Horizontal 2' },
        k = { '<cmd>lua horizontal3:toggle()<CR>', 'Horizontal 3' },
        l = { '<cmd>lua horizontal4:toggle()<CR>', 'Horizontal 4' },
        s = { '<cmd>:ToggleTermSendVisualSelection<CR>', 'Send Visual Selection' },
    },
    ["<leader>t"] = {
        name = 'Terminal',
        p = { '<cmd>lua _PYTHON_TOGGLE()<CR>', 'Python' },
        h = { '<cmd>lua horizontal1:toggle()<CR>', 'Horizontal 1' },
        j = { '<cmd>lua horizontal2:toggle()<CR>', 'Horizontal 2' },
        k = { '<cmd>lua horizontal3:toggle()<CR>', 'Horizontal 3' },
        l = { '<cmd>lua horizontal4:toggle()<CR>', 'Horizontal 4' },
        s = { '<cmd>:ToggleTermSendVisualSelection<CR>', 'Send Visual Selection' },
    },
}

wk.register(mapping, opts)

