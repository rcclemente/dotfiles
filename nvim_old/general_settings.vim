" remap leader key
let mapleader=" "
" leader timeout
set timeoutlen=300

set autoindent                  " always set autoindenting on
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set cursorline                  " highlight the current line"
set encoding=utf-8
set expandtab
set history=1000                " keep 1000 lines of command line history
set hlsearch
set incsearch                   " do incremental searching
set laststatus=2
set mouse=a
set nobackup                    " do not keep a backup file, use versions instead
set number
set relativenumber
set ruler
set ruler                       " show the cursor position all the time
set shiftwidth=2
set showcmd                     " display incomplete commands
set showmode
set smarttab
set softtabstop=2
set tabstop=2

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

set complete=.,w,b,u,t,i,kspell

" strip spaces when saving
autocmd BufWritePre * %s/\s\+$//e
" change tabs to spaces
autocmd BufWritePre * :%retab!

if $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
  set termguicolors
endif

" dictionary completion c-x c-k
set dictionary+=/usr/share/dict/words

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*,*/npm-debug.log,*/vendor/*,*/Packages/*

" Performance improvments
if has("mac")
  " set nocursorline

  " set foldlevel=0
  " set foldmethod=syntax
  set foldmethod=indent
  set foldlevel=1
  set foldclose=all
endif

set listchars+=space:␣
set nolist

" Python
autocmd Filetype python     setlocal ts=4 sts=4 sw=4 expandtab
" Go
autocmd Filetype go         setlocal ts=4 sts=4 sw=4 expandtab
" Javascript
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab

" Markdown
autocmd BufRead *.md syn match markdownError "\w\@<=\w\@="
