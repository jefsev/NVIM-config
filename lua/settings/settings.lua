vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.opt.encoding = 'utf8'
vim.opt.guifont = 'DroidSansMono_Nerd_Font:h10'
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'noinsert', 'menuone', 'noselect' }
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.autoindent = true
vim.opt.inccommand = 'split'
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.wildmenu = true
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.opt.spell = true
vim.opt.ttyfast = true
vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 4
vim.opt.updatetime = 300
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', '<Space>p', '<cmd>tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>n', '<cmd>tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>o', '<cmd>tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>c', '<cmd>tabc<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>s', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<silent><expr> <tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<silent><expr> <cr>', 'pumvisible() ? "<C-y>" : "<CR>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('n', '<Space>\\', '<cmd>CopilotChatToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

-- Telescope kemapping
vim.api.nvim_set_keymap('n', '<Space>u', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>f', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>r', '<cmd>Telescope splitright<CR>', { noremap = true, silent = true })

-- ToggleTerm keymapping
vim.api.nvim_set_keymap('n', '<Space>/1', '<cmd>ToggleTerm 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>/2', '<cmd>ToggleTerm 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>/3', '<cmd>ToggleTerm 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>/4', '<cmd>ToggleTerm 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>/', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Space>/', '<C-\\><C-n><cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>/a', '<cmd>ToggleTermToggleAll<CR>', { noremap = true, silent = true })
