"""""""""""""""""
" Defaults go here
"""""""""""""""""
" syntax highlighting
syntax on
" better safe than sorry
set nocompatible

" Allows loading of file, detection and indention to on
filetype plugin indent on    " required

"""""""""""""""""

"""""""""""""""""
" Load everything per file
"""""""""""""""""

" All plugin loading goes here plus the selected Theme
source $HOME/.config/nvim/plugins.vim

" General settings native to vim
source $HOME/.config/nvim/general_settings.vim

" Filetype and tab settings
source $HOME/.config/nvim/file_settings.vim

" Keyboard mappings
source $HOME/.config/nvim/keyboard_mappings.vim

" Plugin configuration
source $HOME/.config/nvim/plugins_config.vim

