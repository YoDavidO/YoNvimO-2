-- lua/plugins.lua
return {
	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup{}
		end
	},
  
  -- Fuzzy Finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('nvim-tree').setup{}
    end
  },

  -- Syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate' -- Update parsers on install/update
  },

  -- Formatting & linting (none-ls replaces null-ls)
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    }
  },

  -- LSP Config
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'nvimtools/none-ls.nvim', -- for additiona LSP features
      'yioneko/nvim-vtsls' 
    },
    config = function()
      require("lsp") -- Load LSP config from separate file
    end
  },
  
  -- Autocomplete
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'L3M0N4D3/LuaSnip', -- Snippets engine
      'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
          }, {
            { name = 'buffer' }
        })
      })
    end
  },
  
  -- React support
  'MaxMEllon/vim-jsx-pretty',

	-- Color scheme
	{
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd[[colorscheme tokyonight-storm]]
		end
	},
  
	-- Indent Guides
	{
		'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
	},

  -- Auto-closing brackets
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    convig = true,
    opts = {
        check_ts = true, -- Enable treesitter
        ts_config = {
          lua = {'string'},-- Don't add pairs in lua string treesitter nodes
          javascript = {'template_string'},-- Don't add pairs in javscript template_string treesitter nodes
          java = false,-- Don't check treesitter on java
        }
    }
  }
}

