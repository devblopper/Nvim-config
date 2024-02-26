return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
	ensure_installed = {
	  "lua_ls",
	  "clangd",
	  "cmake"
        }
      })
    end
  },
  { "folke/neodev.nvim", 
    config = function ()
      require("neodev").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({
	lineLength = 120
      })
    end
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspconfig = require('lspconfig')

      local servers = {
	'lua_ls',
	'clangd',
	'cmake'
      }
      for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
	  -- on_attach = my_custom_on_attach,
	  capabilities = capabilities,
	  lineLength = 120
	}
      end

      cmp.setup({
	snippet = {
	  expand = function(args)
	    luasnip.lsp_expand(args.body)
	  end
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-k>'] = cmp.mapping.scroll_docs(-4), -- Up
	  ['<C-j>'] = cmp.mapping.scroll_docs(4), -- Down
	  -- C-b (back) C-f (forward) for snippet placeholder navigation.
	  ['<C-c>'] = cmp.mapping.complete(),
	  ['<CR>'] = cmp.mapping.confirm {
	    behavior = cmp.ConfirmBehavior.Replace,
	    select = true,
	  },
	  ['<Tab>'] = cmp.mapping(function(fallback)
	    if cmp.visible() then
	      cmp.select_next_item()
	    elseif luasnip.expand_or_jumpable() then
	      luasnip.expand_or_jump()
	    else
	      fallback()
	    end
	  end, { 'i', 's' }),
	  ['<S-Tab>'] = cmp.mapping(function(fallback)
	    if cmp.visible() then
	      cmp.select_prev_item()
	    elseif luasnip.jumpable(-1) then
	      luasnip.jump(-1)
	    else
	      fallback()
	    end
	  end, { 'i', 's' }),
	}),
	sources = {
	  { name = 'nvim_lsp' },
	  { name = 'luasnip' },
	},
      })
    end
  },
}
