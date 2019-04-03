syntax on

" remap leader key
let mapleader=" "
set nocompatible              " be iMproved, required

""""""""""""""""""""
" Plugins
""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Coloscheme First!!
Plugin 'flazz/vim-colorschemes'
colorscheme wombat256

" Git fugitive
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'

" Vim airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'wincent/scalpel'
call vundle#end()            " required
" Run this after adding to the lines above
" vim +PluginInstall +qall
""""""""""""""""""""

filetype plugin indent on    " required
set backspace=indent,eol,start
set nobackup                    " do not keep a backup file, use versions instead
set history=1000                " keep 50 lines of command line history
set encoding=utf-8
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmode
set incsearch                   " do incremental searching
set ruler
set relativenumber
set number
set mouse=a
set autoindent                  " always set autoindenting on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set hlsearch
set clipboard=unnamed
set cmdheight=1
set laststatus=2
set cursorline

" Split settings
set splitbelow
set splitright
set pastetoggle=<F3>

set swapfile
set dir=~/tmp
set hidden
set showmatch
set matchtime=3
set scrolloff=3

" strip spaces when saving
autocmd BufWritePre * %s/\s\+$//e
" change tabs to spaces
autocmd BufWritePre * :%retab!

if $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
  set termguicolors
endif

""""""""""""""""""""
" KEYBOARD MAPPINGS
""""""""""""""""""""

" Toggle wrapping
nnoremap <F4> :set wrap!<CR>
" Enter key to move line down
nnoremap <Enter> O<ESC>j
" select all copy
nnoremap <Leader>sa ggvG$

" MISC
nnoremap noh :nohlsearch<CR>

" Copy relative filename to clipboard
nmap <Leader>fr :let @*=expand("%")<CR>
" Copy full path filename with path to clipboard
nmap <Leader>fp :let @*=expand("%:p")<CR>
" Copy filename with path to clipboard
nmap <Leader>ff :let @*=expand("%:t")<CR>

" reload vimrc
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>:nohlsearch<CR>

" Splits
nnoremap vv :vsplit \| b
nnoremap vs :split \| b

""""""""""""""""
" Plugins
""""""""""""""""
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Airline
let g:airline_theme='base16_eighties'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'airline'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

nmap <Leader>s <Plug>(Scalpel)
