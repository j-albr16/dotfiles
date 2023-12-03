
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local theme = require('telescope.themes')
local wk = require('which-key')

local  opts = {
    mode = 'n',
    prefix = '<leader>',
}

local mappings = {
    f = {
        name = 'Find',
        f = { builtin.find_files, 'Find Files' },
        b = { builtin.buffers, 'Find Buffers' },
        g = { builtin.git_files, 'Git Files' },
        s = { builtin.live_grep, 'Live Search' },
    },
}

wk.register(mappings, opts)

local mappings = {
    ["<C-f>"] = { function() 
            builtin.grep_string({search = vim.fn.input("Grep String > ")})
        end , 'Grep String' },
}

wk.register(mappings, {})


require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<C-c>"] = { "<esc>", type="command" },
                ["<C-e>"] = "close",
                ["<C-f>"] = "preview_scrolling_up",
                ["<C-b>"] = "preview_scrolling_down",
            },
            n = {
                ["<C-d>"] = "delete_buffer",
                ["<C-c>"] = "close",
                q = "close",
                ["<C-f>"] = "preview_scrolling_up",
                ["<C-b>"] = "preview_scrolling_down",
                ["<C-j>"] = actions.toggle_selection + actions.move_selection_next,
                ["<C-k>"] = actions.toggle_selection + actions.move_selection_previous,
            }
        }
    },
    pickers = {
                find_files = {
                  theme = "dropdown",
                },
                buffers = {
                  theme = "dropdown",
                  initial_mode = "normal",
                },
                git_files = {
                  theme = "dropdown",
                },
                live_grep = {
                  theme = "dropdown",
                },
                grep_string = {
                  initial_mode = "normal",
                  theme = "dropdown",
                },
    },
})
