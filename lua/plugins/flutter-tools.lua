return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function ()
    require("flutter-tools").setup({
      lsp = {
	settings = {
	  lineLength = 120
	}
      },
      debugger = {
	enabled = true,
	run_via_dap = true,
	exception_breakpoints = {},
      },
      widget_guides = {
	enabled = true
      }
    })
  end,
}
