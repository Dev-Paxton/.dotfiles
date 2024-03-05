" Hybrid line numbers
set number
set relativenumber

" Tabstop
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" Sync clipboard
set clipboard+=unnamedplus

set undofile

" Leaderbutton
map <Space> <Nop>
let mapleader = ' '

" Install Pugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" -- Themes --
Plug 'navarasu/onedark.nvim'
Plug 'olivercederborg/poimandres.nvim'
Plug 'rose-pine/neovim'

" -- Plugins --
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" Lualine
Plug 'nvim-lualine/lualine.nvim'

" nvim-cmp for autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Mason to automate language server installation
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'onsails/lspkind.nvim'

Plug 'ThePrimeagen/vim-be-good' 
call plug#end()

"colorscheme onedark
colorscheme poimandres
