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

" Ctags
command! Mtags !ctags --languages=ruby,javascript --exclude=.git --exclude=log --recurse . `bundle show --paths`

""""""""""""""
" Auto complete
"""""""""""""

""""""""""""""""""""
" Abbreviation
""""""""""""""""""""
abbr wtf require "byebug"<esc>obyebug<esc>
