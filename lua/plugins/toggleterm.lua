return {
  "akinsho/toggleterm.nvim", 
  version = "*", 
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]]
    })

    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>git", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
  end
}
