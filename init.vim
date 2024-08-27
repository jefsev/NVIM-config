call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'zbirenbaum/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'neovim/nvim-lspconfig'
Plug 'vim-airline/vim-airline'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'github/copilot.vim'

call plug#end()

set encoding=utf8
set guifont=DroidSansMono_Nerd_Font:h10
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set relativenumber
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim
set signcolumn=yes
set tabstop=4
set updatetime=300
set termguicolors
let g:airline#extensions#tabline#enabled=0
let g:airline_theme = "tokyonight"

" Get lua config
lua require('options')

colorscheme tokyonight-night

nnoremap <Space>p <cmd>tabprevious<CR>
nnoremap <Space>n <cmd>tabnext<CR>
nnoremap <Space>o <cmd>tabnew<CR>
nnoremap <Space>c <cmd>tabc<CR>
nnoremap <Space>f <cmd>Telescope find_files<CR>
nnoremap <Space>r <cmd>Telescope splitright<CR>
nnoremap <Space>s :call CocAction('format') <bar> :w<CR>
nnoremap <Space>e <cmd>NvimTreeToggle<CR>
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
nnoremap <Space>/ <cmd>ToggleTerm<CR>
tnoremap <Space>/ <C-\><C-n><cmd>ToggleTerm<CR>
nnoremap <Space>\ <cmd>CopilotChatToggle<CR>
nnoremap <C-h> <C-w>h " Move to the left window
nnoremap <C-j> <C-w>j " Move to the bottom window
nnoremap <C-k> <C-w>k " Move to the top window
nnoremap <C-l> <C-w>l " Move to the right window


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
