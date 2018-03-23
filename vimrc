syntax on

" remap leader key
let mapleader=" "

set nocompatible
filetype off

""""""""""""""""""""
" Plugins
""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Coloscheme First!!
" Manually download these and add to ~/.vim/colors/
Plugin 'flazz/vim-colorschemes'
colorscheme Tomorrow-Night-Eighties

" Vim airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'

" Git
Plugin 'airblade/vim-gitgutter'

" Git fugitive
Plugin 'tpope/vim-fugitive'

" Language plugins
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'fatih/vim-go'

" Editor plugin
Plugin 'tpope/vim-repeat'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Find text in file
Plugin 'mileszs/ack.vim'

" FZF
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Scalpel
Plugin 'wincent/scalpel'

" Commenter
Plugin 'tomtom/tcomment_vim'

" Editor helper
Plugin 'ervandew/supertab'
Plugin 'gregsexton/matchtag'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
" Run this after adding to the lines above
" vim +PluginInstall +qall
""""""""""""""""""""

filetype plugin indent on    " required
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

set swapfile
set directory^=~/tmp//
set hidden
set showmatch
set matchtime=3
set scrolloff=3
" strip spaces when saving
autocmd BufWritePre * %s/\s\+$//e

set ignorecase
set smartcase

" Ruby
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Phython
autocmd Filetype python setlocal ts=2 sts=2 sw=2 expandtab

" Html
autocmd FileType html,javascript.jsx set omnifunc=htmlcomplete#CompleteTags

" allow to be modifiable in fugitive
set modifiable

" dictionary completion c-x c-k
set dictionary+=/usr/share/dict/words

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/bower_components/*,*/node_modules/*,*/npm-debug.log,*/vendor/*,*/Packages/*

""""""""""""""""""""
" KEYBOARD MAPPINGS
""""""""""""""""""""
" Up and down thru linewrap
nnoremap j gj
nnoremap k gk

" Toggle relative number
nnoremap nn :set relativenumber!<CR>

" Toggle wrapping
nnoremap <F4> :set wrap!<CR>
" Enter key to move line down
nnoremap <Enter> O<ESC>j
" select all copy
nnoremap <Leader>sa ggvG$
" run selection in commandline
xnoremap <leader>c <esc>:'<,'>:!bash<CR>

" Run last colon command
nnoremap `` @:

" MISC
nnoremap noh :nohlsearch<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>wq :wq<space>

" Copy relative filename to clipboard
nmap <Leader>fr :let @*=expand("%")<CR>
" Copy full path filename with path to clipboard
nmap <Leader>fp :let @*=expand("%:p")<CR>
" Copy filename with path to clipboard
nmap <Leader>ff :let @*=expand("%:t")<CR>

" reload vimrc
nnoremap <Leader>r :so $MYVIMRC<CR>:nohlsearch<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Splits
nnoremap vv :vsplit<space>
nnoremap vs :split<space>

" Buffers
nnoremap <Leader>bj :bnext<CR>
nnoremap <Leader>bk :bp<CR>
" nnoremap <Leader>bb :buffers<CR>
" nnoremap <Leader>ba :e<space>
nnoremap <Leader>bd :bd!<CR>

" Tabs
" nnoremap tn :tabnew<space>
" nnoremap tk :tabnext<CR>
" nnoremap tj :tabprev<CR>
" nnoremap th :tabfirst<CR>
" nnoremap tl :tablast<CR>

" Use buffers instead of tabs
" nnoremap tn :e<space>
nnoremap tj :bnext!<CR>
nnoremap tk :bprev!<CR>
nnoremap th :bfirst!<CR>
nnoremap tl :blast!<CR>
" nnoremap td :bd!<CR>
nnoremap tq <C-w>c

" Visual block tabbing
vmap > >gv
vmap < <gv

" Delete into limbo
vnoremap <Leader>d "_d
nnoremap <Leader>d "_d

" insert new line but remain in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

""""""""""""""""""""
" Plugin config
""""""""""""""""""""

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
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=Black gui=NONE guifg=DarkGrey guibg=NONE

" Nerdtree
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <silent> <leader>c :NERDTreeFind<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

" Scalper - find and replace
nmap <Leader>s <Plug>(Scalpel)

" FZF
let g:fzf_layout = { 'down': '~30%' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Custom fzf mappings
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>i :History<CR>
nnoremap K :Ag <C-R><C-W><CR>
" nnoremap K :Ack <C-R><C-W><CR>
" let g:ackprg = 'ag --nogroup --nocolor --column'
" map <Leader>a :Ack<Space>
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

" Javascript plugins
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Auto Pairs
let g:AutoPairsFlyMode = 1

" Gutentags
" set statusline+=%{gutentags#statusline()}

" iabbrev </ <C-X><C-O>
" iabbrev C-X><C-O>
" imap <C-Space> <C-X><C-O>

""""""""""""""""""""
" Special functions
""""""""""""""""""""

" Ruby auto complete
" https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport
function! CloseRubyEndToken()
  let current_line = getline( '.' )
  let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
  let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
  let stuff_without_do_too = '\s*\(if\|unless\|begin\|case\)'
  let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

  if match(current_line, braces_at_end) <= virtcol('.') &&  match(current_line, braces_at_end) > 0
    return "\<CR>}\<C-O>O"
  elseif match(current_line, stuff_without_do_too) >= 0
    return "\<CR>end\<C-O>O"
  elseif match(current_line, stuff_without_do) >= 0
    return "\<CR>end\<C-O>O"
  elseif match(current_line, with_do) >= 0
    return "\<CR>end\<C-O>O"
  else
    return "\<CR>"
  endif
endfunction
autocmd FileType ruby imap <buffer> <CR> <C-R>=CloseRubyEndToken()<CR>

" Change Branches
fun! s:change_branch(e)
  let res = system("git checkout " . a:e)
  :e!
  :AirlineRefresh
  echom "Change branch to" . a:e
endfun

command! Gbranch call fzf#run(
  \ {
  \ 'source': 'git branch',
  \ 'sink': function('<sid>change_branch'),
  \ 'options': '-m',
  \ 'down': '30%'
  \ })

""""""""""""""""""""
" Auto complete
""""""""""""""""""""
set completeopt=longest,menuone
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))


autocmd FileType html inoremap ;b<Space> <b></b><Esc>FbT>i
autocmd FileType html inoremap ;p<Space> <p></p><Esc>FpT>i
autocmd FileType html inoremap ;div<Space> <div></div><Esc>FdT>i
autocmd FileType html inoremap ;body<Space> <body></body><Esc>FbT>i
autocmd FileType html,javascript.jsx inoremap ;span<Space> <span></span><Esc>FbT>i
