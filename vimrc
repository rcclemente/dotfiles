syntax on
" manually download this 
" mkdir ~/.vim/colors
" wget https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim ~/.vim/colors/
colorscheme jellybeans

""""""""""""""""""""
" Plugins
""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git fugitive
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'

" Editor improvements
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Colors
Plugin 'nanotech/jellybeans.vim' 

" Vim airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'airline'

call vundle#end()            " required
" Run this after adding to the lines above
" vim +PluginInstall +qall
filetype plugin indent on    " required

""""""""""""""""""""

set backspace=indent,eol,start
set nobackup		                " do not keep a backup file, use versions instead
set history=1000		            " keep 50 lines of command line history
set encoding=utf-8
set ruler		                    " show the cursor position all the time
set showcmd		                  " display incomplete commands
set showmode
set incsearch		                " do incremental searching
set ruler
set relativenumber
set number
set mouse=a
set autoindent		              " always set autoindenting on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set hlsearch
set clipboard=unnamed
set cmdheight=1
set laststatus=2

" Split settings
set splitbelow
set splitright
set pastetoggle=<F3>

""""""""""""""""""""
" KEYBOARD MAPPINGS
""""""""""""""""""""

" remap ESC
imap jk <ESC>
vmap jk <ESC>
nnoremap <leader>jk <ESC>
vnoremap <leader>jk <ESC>

" MISC
nnoremap noh :nohlsearch<CR>
nnoremap <Leader>w :w<SPACE> 
nnoremap <Leader>wq :wq<SPACE> 
nnoremap <Leader>qq :q!

" reload vimrc
nnoremap <Leader>r :so $MYVIMRC<CR>
noremap <leader>ev :execute 'e ' . resolve(expand($MYVIMRC))<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Buffers
nnoremap <Leader>bk :bnext<cr>
nnoremap <Leader>bj :bp<cr>
nnoremap <Leader>bb :buffers<CR>
nnoremap <Leader>ba :e<SPACE>
nnoremap <Leader>bd :bd!<CR>

" Splits
nnoremap vv :vsplit<SPACE>
nnoremap vs :split<SPACE>

" Tabs
nnoremap tn :tabnew<SPACE>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NerdTree
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0
