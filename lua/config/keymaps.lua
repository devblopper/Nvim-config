-- NeoTree
vim.keymap.set("n", "<Leader>e", "<cmd>:Neotree filesystem reveal left<cr>")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.type_definition, {})
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
