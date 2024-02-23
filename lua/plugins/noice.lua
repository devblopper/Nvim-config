return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
	["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	["vim.lsp.util.stylize_markdown"] = true,
	["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
	filter = {
	  event = "msg_show",
	  any = {
	    { find = "%d+L, %d+B" },
	    { find = "; after #%d+" },
	    { find = "; before #%d+" },
	  },
	},
	view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    --{ "<c-j>", function() if not require("noice.lsp").scroll(4) then return "<c-j>" end end, silent = true, expr = true, desc = "Scroll down", mode = {"i", "n", "s"} },
    --{ "<c-k>", function() if not require("noice.lsp").scroll(-4) then return "<c-k>" end end, silent = true, expr = true, desc = "Scroll up", mode = {"i", "n", "s"}},
  },
}
