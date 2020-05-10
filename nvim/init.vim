syntax on

" remap leader key
let mapleader=" "
" leader timeout
set timeoutlen=300

set nocompatible

filetype plugin indent on    " required

" All plugin loading goes here plus the selected Theme
source $HOME/.config/nvim/plugins.vim

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

set complete=.,w,b,u,t,i,kspell

" strip spaces when saving
autocmd BufWritePre * %s/\s\+$//e
" change tabs to spaces
autocmd BufWritePre * :%retab!

if $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
  set termguicolors
endif

" Tabulations
" Python
autocmd Filetype python     setlocal ts=4 sts=4 sw=4 expandtab
" Go
autocmd Filetype go         setlocal ts=4 sts=4 sw=4 expandtab
" Javascript
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab


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
" Copy line
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

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <silent> <leader>c :NERDTreeFind<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

nmap <Leader>s <Plug>(Scalpel)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" FZF
let g:fzf_layout = { 'down': '~30%' }

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

" ctrl-x + ctrl-o
set omnifunc=htmlcomplete#CompleteTags

""""""""""""""""""""
" Abbreviation
""""""""""""""""""""
abbr wtf require "byebug"<esc>obyebug<esc>

