""""""""""""""""""""
" Plugins
"
" Download plugin manager first
" curl -fLo $HOME/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""""""""""""""""""""

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
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Git fugitive
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'

" Git
Plug 'airblade/vim-gitgutter'

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Find text in file
Plug 'mileszs/ack.vim'

" close surround
Plug 'jiangmiao/auto-pairs'

" Commenter
Plug 'tomtom/tcomment_vim'

" " Plugin 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" " Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" " Plugin 'neoclide/coc.nvim', {'do': './install.sh nightly'}
call plug#end()

" run :PlugInstall
""""""""""""""""""""

