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
























