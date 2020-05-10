""""""""""""""""""""
" Plugins
"""""""""""""""""
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

" Plugin 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plugin 'neoclide/coc.nvim', {'do': './install.sh nightly'}

call vundle#end()            " required
" Run this after adding to the lines above
" vim +PluginInstall +qall
""""""""""""""""""""

