vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("catppuccin").setup({
  flavor = "mocha",
  integrations = {
    nvimtree = true,
    coc_nvim = true,
    telescope = true,
  },
})

-- empty setup using defaults
require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
})

require("toggleterm").setup({
  direction = 'float',
})

require("CopilotChat").setup({
  debug = true,
  window = {
    layout = 'float'
  }
})

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
  }
}
