require("catppuccin").setup({
  flavor = "mocha",
  transparent_background = true,
  integrations = {
    nvimtree = true,
    coc_nvim = true,
    telescope = true,
  },
})

vim.g.airline_theme = 'catppuccin'
vim.cmd('colorscheme catppuccin-mocha')

require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
  view = {
    side = 'right',
  }
})

require("toggleterm").setup({
  direction = 'float',
})

-- require("copilot").setup({
--     suggestion = {
--       enabled = false,
--     },
-- })
--
-- require("CopilotChat").setup({
--   debug = true,
--   window = {
--     layout = 'float'
--   }
-- })

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<Space>r"] = require('telescope.actions').select_vertical,
      },
      n = {
        ["<Space>r"] = require('telescope.actions').select_vertical,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  }
}

-- nvim-cmp setup
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- Select the [n]ext item
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Select the [p]revious item
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- If you want to use `cmp-git` plugin, uncomment the following lines
--[[ 
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup()
]]

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for `:`
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})



















