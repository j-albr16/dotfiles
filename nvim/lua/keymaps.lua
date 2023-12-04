-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

------------------
-- Terminal mode -
------------------
--
-----------------
-- Normal mode --
-----------------
-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- vertical movement
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- search mode
vim.keymap.set('n', '<C-p>', ':Ex<CR>')

-- smart pasting
vim.keymap.set('x', '<leader>p', '\"_dP', opts)

-----------------
-- Visual mode --
-----------------
-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('v', "J", ":m '>+1<CR>gv'", opts)
vim.keymap.set('v', "K", ":m '<-2<CR>gv'", opts)
vim.keymap.set('v', '<leader>s', ':%s/<CR>//g<Left><Left>', opts)

-- search
local wk = require('which-key')
local opts = { prefix="<leader>" }
local mapping = {
    s = {
        name = "search",
        r = {":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", "Search and Replace Word"},
        a = {":cdo! %s///gc<left><left><left><left>", "Search and Replace all"},
    },
}
wk.register(mapping, opts)







