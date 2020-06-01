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
" Load everything per file
"""""""""""""""""

" All plugin loading and install goes here plus the selected Theme
source $HOME/.config/nvim/plugin_install.vim

" General settings native to vim
source $HOME/.config/nvim/general_settings.vim

" Filetype and tab settings
source $HOME/.config/nvim/file_settings.vim

" Keyboard mappings
source $HOME/.config/nvim/keyboard_mappings.vim

" General plugin configuration
source $HOME/.config/nvim/plugin_general_config.vim

" Coc specific plugin configuration
source $HOME/.config/nvim/plugin_coc_config.vim

" Custom plugins
source $HOME/.config/nvim/plugins/BufOnly.vim
