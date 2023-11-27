local dap = require('dap')

local current_dir = vim.fn.expand('%:p:h') .. '/'

local python_path = os.getenv('PYTHONPATH')

if python_path == nil then
    python_path = current_dir
else
    python_path = current_dir .. ":" .. python_path
end

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'debug project file',
        cwd = current_dir,
        -- module = '${relativeFile}',
        program = "${relativeFile}",
        pythonPath = function ()
            return current_dir .. 'venv/bin/python'
        end,
        env = {
            PYTHONPATH = python_path
        },
    },
    {
      type = 'python',
      request = 'launch',
      name = 'debug test file',
      module = 'pytest',
      args = function()
          return { '${file}'}
      end,
      pythonPath = function ()
        return current_dir .. 'venv/bin/python'
      end,
    },
    {
      type = 'python',
      request = 'launch',
      name = 'debug all tests',
      module = 'pytest',
      args = {"tests"},
      pythonPath = function ()
        return current_dir .. 'venv/bin/python'
      end,
    }
}

dap.adapters.python = {
  type = 'executable',
  command = "venv/bin/python",
  args = { '-m', 'debugpy.adapter' }
}


-- dap.adapters.python = {
--     type = 'executable',
--     command = current_dir .. 'venv/bin/python',
--     args = { '-m', 'debugpy.adapter' },
-- }


