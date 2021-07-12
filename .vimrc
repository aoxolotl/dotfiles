" Use modern mappings of vim
set nocompatible

" Enable syntax
filetype on
syntax enable
filetype plugin on
filetype plugin indent on

" Silently execute python3
" Fixes plugin issues
if has('python3')
  silent! python3 1
endif

" History size 10000
set history=10000

" CXX indentation
set shiftwidth=2
set tabstop=2

" 256 colors
set t_Co=256

" Invert text in visual mode
set background=dark
" highlight Visual cterm=reverse ctermbg=NONE
" highlight Search cterm=reverse ctermbg=NONE

" Fuzzy file finder
set path+=**
set wildmenu

" Status line
set laststatus=2
set showmode
set showcmd

" mouse doesnt move while typing
set mouse=c

set backspace=indent,eol,start

" Smartcase while searching
set ignorecase smartcase

" Y as it should be
nnoremap Y y$

" navigate on wrapped lines
map j gj
map k gk

" map leader to space
let mapleader=" "

" Quicksave
nmap <leader>w :w<CR>

" Quicktags
map <leader>t <Esc>:!ctags -R .<CR>

" set default serach to rg
if executable('rg')
	set grepprg=rg\ --vimgrep
endif

" File browser
" let g:netrw_banner=0 " Disable banner
" let g:netrw_browse_split=4 " Open in prior window
" let g:netrw_altv=1 " Right split
" let g:netrw_liststyle=3 " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"

" Navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Code folding
"set foldmethod=indent
"set foldlevel=99

" Set update time
set updatetime=100

nnoremap <leader>z za

" Manage plugins with plugi
" Runtime path
call plug#begin('~/.vim/plugged')

""" Insert plugins here
Plug 'Konfekt/FastFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'christoomey/vim-tmux-navigator'
""" Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'daveyarwood/vim-alda'
""" End plugins

call plug#end()


"" Filetype specific commands
" Run python script
autocmd FileType python noremap <leader>y <Esc>:!clear; python %<CR>
" Disable indent on lin
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:

" Shell script
autocmd FileType sh noremap <leader>y <Esc>:!clear; bash %<CR>

" Vim rc
autocmd FileType vim noremap <leader>y <Esc>:source %<CR>

" Run grip on markdown file
autocmd FileType markdown noremap <leader>y <Esc>:!grip % -b<CR>

" pdflatex for tex files
autocmd FileType tex noremap <leader>y <Esc>:!pdflatex % > /dev/null; bibtex *.aux > /dev/null;
			\pdflatex % > /dev/null; pdflatex % > /dev/null;<CR>

" indentations for yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" 80 char limit for markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" Play alda files 
autocmd FileType alda noremap <leader>y <Esc>:!clear; alda play --file %<CR>

""" End file type specific commands


nmap <leader>e /^\n 	ýa00/kuk"tp00"tyt	/kukdkuj

" quicksearch
nnoremap L :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>r :Rg 
nnoremap <leader>f :Files<CR>

cnoremap <expr> %% expand('%:h').'/'
nmap <leader>ew :e %%
nmap <leader>ev :vs %%
