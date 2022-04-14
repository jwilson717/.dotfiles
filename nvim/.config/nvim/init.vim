let mapleader = " "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

" setup plugins
call plug#begin()

	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-nvim-lua'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'preservim/nerdtree'
	Plug 'morhetz/gruvbox'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Syntax highlights
syntax on
set nohlsearch

" search
set incsearch
set ic
set smartcase

" Colors
colorscheme gruvbox
highlight Normal ctermbg=none
" set background=dark

" line numbers
set rnu nu 
nmap <leader>nm :set rnu!<CR>

" indentation
set smartindent 
set tabstop=4 softtabstop=4
set shiftwidth=4

" clipboard
set clipboard=unnamed

" undo
set undodir=~/.local/nvim/undodir
set undofile

" update path
set path+=**

" show matching brackets
set showmatch

" enable mouse
set mouse=a

" filetype plugin
filetype plugin on
filetype indent on

" nerdtree mappings
let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeFocus<CR>

" keep J centered
nnoremap J mzJ`z

" moving lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" switching tabs
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>
nnoremap 1 :1gt<CR>
nnoremap 2 :2gt<CR>
nnoremap 3 :3gt<CR>
nnoremap 4 :4gt<CR>
nnoremap 5 :5gt<CR>
nnoremap 6 :6gt<CR>
nnoremap 7 :7gt<CR>
nnoremap 8 :8gt<CR>
nnoremap 9 :9gt<CR>
nnoremap 0 :tablast<CR>

set laststatus=2
set statusline=%#PmenuSel#\ %{fugitive#head()}\ %#StatusLine#\ %f\ %m%=%y\ %l:%c\ 

" telescope mappings
nnoremap <leader>f :Telescope git_files<CR>
nnoremap <leader>F :Telescope find_files<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gc :Telescope git_commits<CR>
nnoremap <leader>pv :Telescope live_grep<CR>

" connect lua
lua require('init')