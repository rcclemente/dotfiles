""""""""""""""""""""
" Plugins
"
" Download plugin manager first
" curl -fLo $HOME/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""""""""""""""""""""

" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Coloscheme First!!
" Manually download these and add to ~/.config/nvim/colors/
Plug 'flazz/vim-colorschemes'
Plug 'EdenEast/nightfox.nvim'
colorscheme Tomorrow-Night-Eighties
" colorscheme nightfox
" Set the linenumber background color to black
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=Black gui=NONE guifg=DarkGrey guibg=Black
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=Black gui=NONE guifg=DarkGrey guibg=NONE

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Syntax
Plug 'sheerun/vim-polyglot'

" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Align with operators
Plug 'junegunn/vim-easy-align'

" Vim airline theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tmux plugins
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Git fugitive
Plug 'tpope/vim-fugitive'

" Git line marker
Plug 'airblade/vim-gitgutter'

" Search and replace tool
Plug 'wincent/scalpel'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'

" Find text in file
Plug 'mileszs/ack.vim'

" close surround
Plug 'jiangmiao/auto-pairs'

" Commenter
Plug 'tomtom/tcomment_vim'

" Tab line formatting
Plug 'godlygeek/tabular'

" coc autocomplete
" make sure to install node > v8
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}

" https://github.com/rstacruz/vim-coc-settings
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
" Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting

" Markdown preview
" https://github.com/iamcco/markdown-preview.nvim
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

" run :PlugInstall
""""""""""""""""""""

