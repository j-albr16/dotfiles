
local term = require("toggleterm")

local config = {
  direction = 'horizontal',
  size = 20,
  persist_size = true,
  start_in_insert = true,
}


term.setup(config)

local Terminal = require('toggleterm.terminal').Terminal

python = Terminal:new({cmd='python3', hidden = true, direction = 'float'})

function _PYTHON_TOGGLE()
 python:toggle()
end

horizontal1 = Terminal:new({cmd=vim.o.shell, hidden = true, direction = 'horizontal'})
horizontal2 = Terminal:new({cmd=vim.o.shell, hidden = true, direction = 'horizontal'})
horizontal3 = Terminal:new({cmd=vim.o.shell, hidden = true, direction = 'horizontal'})
horizontal4 = Terminal:new({cmd=vim.o.shell, hidden = true, direction = 'horizontal'})

local wk = require('which-key')
local opts = { noremap = true, silent = true, prefix = '<leader>', mode = 'n' }
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
}

wk.register(mapping, opts)

