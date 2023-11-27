local wk = require('which-key')

local  opts = {
    mode = 'n',
    prefix = '<leader>',
}

local mappings = {
    g = {
        name = 'Git',
        p = { '<cmd>:Git push<CR>', 'Push' },
        u = { '<cmd>:Git pull<CR>', 'Pull' },
        w = { '<cmd>:Git write<CR>', 'Write' },
        m = { '<cmd>:Git merge<CR>', 'Write' },
        d = { '<cmd>:Gdiffsplit<CR>', 'Write' },
        g = { '<cmd>:Git <CR>', 'Open Git' },
    },
}

wk.register(mappings, opts)

