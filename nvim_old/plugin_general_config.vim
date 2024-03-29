""""""""""""""""
" Airline
""""""""""""""""
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

""""""""""""""""
" Nerdtree
"""""""""""""""""
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <silent> <leader>e :NERDTreeFind<CR>
let g:nerdtree_tabs_open_on_console_startup = 0
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

""""""""""""""""
" Scalpel
"""""""""""""""""
nmap <Leader>s <Plug>(Scalpel)

""""""""""""""""
" Nerdtree
"""""""""""""""""
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
""""""""""""""""
" FZF
"""""""""""""""""
let g:fzf_layout = { 'down': '~30%' }

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>bl :BLines<CR>
nnoremap <Leader>i :History<CR>
nnoremap K :Ag <C-R><C-W><CR>
nnoremap <Leader>a :Ag<space>

""""""""""""""""
" vim-tmux-navigator
"""""""""""""""""
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

""""""""""""""""
" FZF
"""""""""""""""""
" fugitive mappings
nnoremap <Leader>hu :GitGutterUndoHunk<CR>
nnoremap <Leader>hr :GitGutterRevertHunk<CR>
nnoremap <Leader>hj :GitGutterNextHunk<CR>
nnoremap <Leader>hk :GitGutterPrevHunk<CR>
nnoremap <Leader>gr :Gread<CR>

set diffopt+=vertical

""""""""""""""""
" coc solargraph http://blog.jamesnewton.com/setting-up-coc-nvim-for-ruby-development
""""""""""""""""
let g:coc_global_extensions = ['coc-solargraph']

nnoremap <Leader>c gggcG

"" Markdown
" remove highlighting of underscore `_`
" syn match markdownError "\w\@<=\w\@="

""""""""""""""""
" COC
"""""""""""""""""
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
" nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
" nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>


