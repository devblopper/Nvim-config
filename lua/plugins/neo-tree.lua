return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set("n", "<Leader>e", "<cmd>:Neotree filesystem reveal left<cr>")

    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      window = {
        position = "left",
        width = 40,
        mapping_options = {
          nowait = true,
        },
        mappings = {
         ["q"] = "close_window",
        }
      },
    })
  end,
}
