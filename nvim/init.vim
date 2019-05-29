syntax on

" remap leader key
let mapleader=" "
" leader timeout
set timeoutlen=300

set nocompatible

""""""""""""""""""""
" Plugins
""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Coloscheme First!!
" Manually download these and add to ~/.vim/colors/
Plugin 'flazz/vim-colorschemes'
colorscheme Tomorrow-Night-Eighties
"
" Vim airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'

" Search and replace tool
Plugin 'wincent/scalpel'

" Git fugitive
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'

" Git
Plugin 'airblade/vim-gitgutter'

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Find text in file
Plugin 'mileszs/ack.vim'

" FZF
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" close surround
Plugin 'jiangmiao/auto-pairs'

" Commenter
Plugin 'tomtom/tcomment_vim'

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

" Python
autocmd Filetype python setlocal ts=2 sts=2 sw=2 expandtab

" Go
autocmd Filetype go setlocal ts=4 sts=4 sw=4 expandtab

" dictionary completion c-x c-k
set dictionary+=/usr/share/dict/words

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*,*/npm-debug.log,*/vendor/*,*/Packages/*

" Performance improvments
if has("mac")
  " set nocursorline

  " set foldlevel=0
  set foldmethod=syntax
endif

""""""""""""""""""""
" KEYBOARD MAPPINGS
""""""""""""""""""""
nnoremap Y y$

" Run last colon command
nnoremap `` @:

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
" Set the linenumber background color to black
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=Black gui=NONE guifg=DarkGrey guibg=Black

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <silent> <leader>c :NERDTreeFind<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

nmap <Leader>s <Plug>(Scalpel)

" FZF
let g:fzf_layout = { 'down': '~30%' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Custom fzf mappings
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>bl :BLines<CR>
nnoremap <Leader>i :History<CR>
nnoremap K :Ag <C-R><C-W><CR>
nnoremap <Leader>a :Ag<space>

" plugin mappings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" fugitive mappings
nnoremap <Leader>hu :GitGutterUndoHunk<CR>
nnoremap <Leader>hr :GitGutterRevertHunk<CR>
nnoremap <Leader>hj :GitGutterNextHunk<CR>
nnoremap <Leader>hk :GitGutterPrevHunk<CR>
nnoremap <Leader>gr :Gread<CR>

" custom commands
" Ctags
command! Mtags !ctags --languages=ruby,javascript --exclude=.git --exclude=log --recurse . `bundle show --paths`

""""""""""""""
" Auto complete
"""""""""""""
