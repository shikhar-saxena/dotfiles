" ------------------------------------------------
" Key-Mappings
" ------------------------------------------------
" To escape nvim terminal using <Esc> key
tnoremap <Esc> <C-\><C-n>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" To move cursor through long soft-wrapped lines
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

map <c-`> :w <CR> :!g++ --std=c++17 -O2 % -o %< && ./%< <CR>

" ------------------------------------------------
" General Options
" ------------------------------------------------
set ruler
set hlsearch
set number
set background=dark
set clipboard^=unnamed,unnamedplus
set completeopt=noinsert,menuone,noselect
set hidden
set mouse=a
" set inccommand=split
set relativenumber
set splitbelow splitright
set fillchars+=vert:│
highlight VertSplit cterm=NONE 
set title
set ttimeoutlen=0
set wildmenu
set smartindent
set ignorecase
set smartcase
"set cc=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

" ------------------------------------------------
" spellcheck
" ------------------------------------------------
"setlocal spell
"set spelllang=en_us
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" ------------------------------------------------
" Tabs
" ------------------------------------------------
set tabstop=2
set expandtab
set shiftwidth=2

" ------------------------------------------------
" Cursor
" ------------------------------------------------
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
set ttimeout
set ttimeoutlen=1
set ttyfast

" ------------------------------------------------
" Syntax
" ------------------------------------------------
set nocompatible
filetype plugin indent on
syntax enable
" setlocal foldmethod=syntax

" ------------------------------------------------
"  Vim Plug
" ------------------------------------------------
call plug#begin()

  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " ------------------------------------------------
  "  Color Schemes
  " ------------------------------------------------
  "Plug 'ghifarit53/tokyonight-vim'
  "Plug 'morhetz/gruvbox'
  "Plug 'joshdick/onedark.vim' 
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  " ------------------------------------------------
  " Other Plugins
  " ------------------------------------------------
  Plug 'itchyny/lightline.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'lervag/vimtex'
  Plug 'lervag/wiki.vim'
	Plug 'sirver/ultisnips'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'preservim/nerdcommenter'
  Plug 'vim-pandoc/vim-pandoc-syntax' 
  Plug 'vim-pandoc/vim-pandoc'
call plug#end()

" ------------------------------------------------
" Color Scheme
" ------------------------------------------------
set termguicolors
colorscheme github_dark_default

" ------------------------------------------------
" Lightline
" ------------------------------------------------
set laststatus=2
set noshowmode " For default vim status bar
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ }

" ------------------------------------------------
" Vimtex
" ------------------------------------------------
let g:vimtex_view_method = 'zathura'
set conceallevel=1
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_fold_enabled=1

" ------------------------------------------------
" Vim-Pandoc
" ------------------------------------------------
let g:pandoc#spell#enabled = 0
let g:pandoc#modules#disabled = ["folding"]
"let g:pandoc#command#autoexec_on_writes = 1
"let g:pandoc#command#autoexec_command = "Pandoc pdf --metadata-file=~/pandoc.yaml --pdf-engine=xelatex"

" ------------------------------------------------
" NERDTree
" ------------------------------------------------
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeFind<CR>
let NERDTreeHighlightCursorline=0

" ------------------------------------------------
" UltiSnips
" ------------------------------------------------
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" ------------------------------------------------
" wiki.vim
" ------------------------------------------------
let g:wiki_root = '~'
let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'
let g:wiki_viewer = { 'pdf': 'xdg-open' }

" ------------------------------------------------
" coc
" ------------------------------------------------
"source ~/.config/nvim/coc.vim
