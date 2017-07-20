syntax on

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

" Coloscheme First!!
" Manually download these and add to ~/.vim/colors/
" colorscheme petrel
let g:space_vim_dark_background = 235
" 233(darkets) -> 238(lightest)
colorscheme space-vim-dark

" Vim airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
let g:airline_theme='luna'
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

" Git fugitive
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'airblade/vim-gitgutter'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

" String and File search
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'r'

" Find text in file
Plugin 'mileszs/ack.vim'
" this requires the silver surfer for speed
if executable('ag')
  " Use Ag over Grep
  " set grepprg=ag\ --nogroup\ --nocolor
  " Use Ag of Ack
  let g:ackprg = 'ag --nogroup --nocolor '

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" Ack config
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
set cursorline

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
nnoremap <Leader>qq :q!<CR>
nnoremap <Leader>o :o!<CR>

" Copy relative filename to clipboard
nmap <Leader>fr :let @*=expand("%")<CR>
" Copy full path filename with path to clipboard
nmap <Leader>fp :let @*=expand("%:p")<CR>
" Copy filename with path to clipboard
nmap <Leader>ff :let @*=expand("%:t")<CR>

" reload vimrc
nnoremap <Leader>r :so $MYVIMRC<CR>:nohlsearch<CR>
noremap <leader>ev :execute 'e ' . resolve(expand($MYVIMRC))<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Splits
nnoremap vv :vsplit<SPACE>
nnoremap vs :split<SPACE>

" Close current split 
nmap <leader>c :ene<CR>:bw #<CR>

" Buffers
nnoremap <Leader>bj :bnext<cr>
nnoremap <Leader>bk :bp<cr>
nnoremap <Leader>bb :buffers<CR>
nnoremap <Leader>ba :e<SPACE>
nnoremap <Leader>bd :bd!<CR>

" Tabs
" nnoremap tn :tabnew<SPACE>
" nnoremap tk :tabnext<CR>
" nnoremap tj :tabprev<CR>
" nnoremap th :tabfirst<CR>
" nnoremap tl :tablast<CR>

" Use buffers instead of tabs
nnoremap tn :e<SPACE>
nnoremap tj :bnext!<CR>
nnoremap tk :bprev!<CR>
nnoremap th :bfirst!<CR>
nnoremap tl :blast!<CR>
nnoremap td :bd!<CR>
nnoremap tq <C-w>c

" Git
nnoremap <Leader>hu :GitGutterUndoHunk<CR>
nnoremap <Leader>hr :GitGutterRevertHunk<CR>
nnoremap <Leader>hj :GitGutterNextHunk<CR>
nnoremap <Leader>hk :GitGutterPrevHunk<CR>
