vim.api.nvim_create_autocmd("BufAdd", {
  callback = function()
    if vim.o.ft == 'guihua' then
      require 'cmp'.setup.buffer { completion = { enable = false } }
    end
  end,
})
