" http://blog.jamesnewton.com/setting-up-coc-nvim-for-ruby-development
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"CocInstall coc-tsserver@1.4.11
" CocInstall coc-solargraph
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
