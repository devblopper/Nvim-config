return {
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "LukasPietzschmann/telescope-tabs",
    config = function ()
      require('telescope').load_extension('telescope-tabs')
      require('telescope-tabs').setup()
    end,
    dependencies = { 'nvim-telescope/telescope.nvim' }
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
	extensions = {
	  ["ui-select"] = {
	    require("telescope.themes").get_dropdown({})
	  }
	}
      })
    end
  }
}

