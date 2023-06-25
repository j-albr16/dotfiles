-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

------------------
-- Terminal mode -
------------------

vim.keymap.set('t', '<C-c>c', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>tn', ':split<cr>:ter<cr>')
vim.keymap.set('n', '<leader>tt', ':split<cr>:b term<CR>')


-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>hh', ':tabp<cr>')
vim.keymap.set('n', '<leader>ll', ':tabn<cr>')
vim.keymap.set('n', '<leader>q', '@')

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)









