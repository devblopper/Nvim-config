return {
  { "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function ()
      --require('dap').setup()
      require('dapui').setup()

      local dap = require('dap')

      -- Adapters
      dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = 'C:\\Dev\\Tools\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
	options = {
	  detached = false
	}
      }

      -- Configurations
      dap.configurations.cpp = {
	{
	  name = "Launch file",
	  type = "cppdbg",
	  request = "launch",
	  program = function()
	    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	  end,
	  cwd = '${workspaceFolder}',
	  stopAtEntry = true,
	  setupCommands = {
	    {
	       text = '-enable-pretty-printing',
	       description =  'enable pretty printing',
	       ignoreFailures = false 
	    },
	  },
	},
	{
	  name = 'Attach to gdbserver :1234',
	  type = 'cppdbg',
	  request = 'launch',
	  MIMode = 'gdb',
	  miDebuggerServerAddress = 'localhost:1234',
	  miDebuggerPath = '/usr/bin/gdb',
	  cwd = '${workspaceFolder}',
	  program = function()
	    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	  end,
	},
      }

      -- Keymaps
      vim.keymap.set('n', '<F5>', function() dap.continue() end)
      vim.keymap.set('n', '<F8>', function() require('dap').step_over() end)
      vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
      vim.keymap.set('n', '<S-F8>', function() require('dap').step_out() end)
      vim.keymap.set('n', '<Leader>dt', function() require('dap').toggle_breakpoint() end)

      --vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
      --vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
      --vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
      --vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
      --vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      --require('dap.ui.widgets').hover()
      --end)
      --vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      --require('dap.ui.widgets').preview()
      --end)
      --vim.keymap.set('n', '<Leader>df', function()
      --local widgets = require('dap.ui.widgets')
      --widgets.centered_float(widgets.frames)
      --end)
      --vim.keymap.set('n', '<Leader>ds', function()
      --local widgets = require('dap.ui.widgets')
      --widgets.centered_float(widgets.scopes)
      --end)
    end
  }
}
