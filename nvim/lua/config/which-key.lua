
local wk = require('which-key')


local blacklist = {
    ['<C-c>'] = {"<C-c>"},
    ['<C-c>'] = {},
}

wk.setup({
    triggers_blacklist = blacklist,
    triggers_nowait = blacklist,
})

