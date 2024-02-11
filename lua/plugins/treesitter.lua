return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
	  enable = true
	},
	indent = {
	  enable = true
	},
	refactor = {
	  highlight_definitions = {
	    enable = true,
	    clear_on_cursor_move = true
	  },
	  smart_rename = {
	    enable = true,
	    keymaps = {
	      smart_rename = "grr",
	    },
	  },
	},
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
  }
}
