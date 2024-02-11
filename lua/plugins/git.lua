return {
  {
    {
      "tpope/vim-fugitive"
    },
    {
      "lewis6991/gitsigns.nvim",
      config = function()
	require("gitsigns").setup()

	--TODO: config keymaps
      end
    },
    {
      "kdheepak/lazygit.nvim",
      dependencies = {
	"nvim-lua/plenary.nvim"
      }
    }
  }
}

