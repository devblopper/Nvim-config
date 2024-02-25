return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")

    local builtin = require("telescope.builtin")
    if builtin ~= nil then
      wk.register({
	f = {
	  name = "File",
	  f = { builtin.find_files, "Find file" },
	  g = { builtin.live_grep, "Live grep" },
	  r = { builtin.oldfiles, "Recent files" },
	},
      }, { prefix = "<leader>" })
    end

    wk.register({
      b = {
	name = "Buffers",
	s = { builtin.buffers, "Show buffers" }
      },
      c = {
	name = "Code",
	d = { vim.lsp.buf.definition, "Jump to definition" },
	a = { vim.lsp.buf.code_action, "Code actions" },
	i = { vim.lsp.buf.hover, "Code info" },
	f = { vim.lsp.buf.format, "Code format" },
	r = { vim.lsp.buf.rename, "Code rename" },
	e = {
	  name = "Errors",
	  n = { vim.diagnostic.goto_next, "Next error" },
	  p = { vim.diagnostic.goto_prev, "Prev error" },
	}
      },
      w = {
	name = "Window",
	s = {
	  name = "split",
	  h = { "<cmd>:sp<CR>", "Horizontal split" },
	  v = { "<cmd>:vs<CR>", "Vertical split" },
	},
	h = { "<cmd>:winc h<CR>", "Go left" },
	l = { "<cmd>:winc l<CR>", "Go right" },
	j = { "<cmd>:winc j<CR>", "Go down" },
	k = { "<cmd>:winc k<CR>", "Go up" },
	r = {
	  name = "resize",
	  w = { "<cmd>:vert res +1<CR>", "width" },
	  h = { "<cmd>:res +1<CR>", "height" }
	}
      }
    }, { prefix = "<leader>" })
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}
