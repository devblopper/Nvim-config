return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = true,
  opts = {
	  disable_filetype = { "TelescopePrompt", "guihua", }
  }
  -- use opts = {} for passing setup options
  -- this is equalent to setup({}) function
}
