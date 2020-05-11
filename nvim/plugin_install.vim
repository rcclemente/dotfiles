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
" Manually download these and add to ~/.vim/colors/
Plug 'flazz/vim-colorschemes'
colorscheme Tomorrow-Night-Eighties

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

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

Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Find text in file
Plug 'mileszs/ack.vim'

" close surround
Plug 'jiangmiao/auto-pairs'

" Commenter
Plug 'tomtom/tcomment_vim'

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

call plug#end()

" run :PlugInstall
""""""""""""""""""""

