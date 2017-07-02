syntax on

set nocompatible
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
set mouse=a
set autoindent		              " always set autoindenting on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set hlsearch
set clipboard=unnamed
set cmdheight=2
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
nnoremap <Leader>r :so $MYVIMRC<CR>:nohlsearch<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Buffers
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bb :buffers<CR>
nnoremap <Leader>ba :e<SPACE>

" Splits
nnoremap vv :vsplit<SPACE>
nnoremap vh :split<SPACE>

" Tabs
nnoremap tn :tabnew<SPACE>
nnoremap tk :tabnext<SPACE>
nnoremap tj :tabprev<SPACE>
nnoremap th :tabnew<SPACE>
nnoremap tl :tablast<SPACE>

" Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" manually download this 
" mkdir ~/.vim/colors
" wget https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim ~/.vim/colors/
colorscheme jellybeans

