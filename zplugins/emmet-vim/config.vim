" Enable ejs syntax as html syntax
au BufNewFile,BufRead *.ejs set filetype=html

" Use prettier to format the javascript code
" Prettier needs to be installed first
autocmd FileType javascript set formatprg=prettier\ --stdin

" Format the Js code on save
" autocmd BufWritePre *.js :normal gggqG


