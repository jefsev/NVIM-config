vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("tokyonight").setup({
  transparent = true, -- Enable this to disable setting the background color
})

require("bufferline").setup{
  options = {
      mode = "tabs",
      diagnostics = "coc",
    }
  }
-- empty setup using defaults
require("nvim-tree").setup()
