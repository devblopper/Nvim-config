return {
  'ray-x/navigator.lua',
  enabled = true,
  dependencies = {
    { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
    { 'neovim/nvim-lspconfig' },
  },
  config = function()
    require('navigator').setup({
      default_mapping = false,
      mason = true,
      lsp = {
	enable = true,
	code_action = {
	  enable = true,
	  sign = true,
	  sign_priority = 40,
	  virtual_text = true
	},
	code_lens_action = {
	  enable = true,
	  sign = true,
	  sign_priority = 40,
	  virtual_text = true
	},
	document_highlight = true,
	format_on_save = false,

	lua_ls = {
	  lineLength = 120
	},
      },
    })
  end,
}
