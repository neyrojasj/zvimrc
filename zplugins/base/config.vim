" Enconding text
scriptencoding utf-8
set encoding=utf-8

" Color schemes i liked
" murphy, slate, koehler
colorscheme slate

" Set the leader key
let mapleader = ","

" Map the character that are not seeing
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set list

" Add mouse integration
set mouse=a

" Change tabs by spaces
set tabstop=2 shiftwidth=2 expandtab

" Remove all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Color the 80th column
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Enable spell checking for certain files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
au BufRead *.rst setlocal spell
au BufRead *.ymal setlocal spell

" Map the Ctrl + Shift + C to copy the selected text into the clipboard
map <F2> : w !pbcopy

" turn hybrid line numbers on
" set number relativenumber
set number

" Highlight the searchs
set hlsearch

" Map a combination to delete text and send it to the null yank register

" shortcut to delete in the black hole register
vnoremap <leader>d "_d

" shortcut to paste but keeping the current register
vnoremap <leader>p "_dP

" Shorcuts to handle tabs
map <Leader>tn :tabnew<CR>
map <Leader>tc :tabclose<CR>
map <Leader>tf :tabnext<CR>
map <Leader>tb :tabprevious<CR>
map <Leader>t1 1gt
map <Leader>t2 2gt
map <Leader>t3 3gt
map <Leader>t4 4gt
map <Leader>t5 5gt
map <Leader>t6 6gt
map <Leader>t7 7gt
map <Leader>t8 8gt
map <Leader>t9 9gt

map <C-S-Left> :tabnext<CR>
map <C-S-Right> :tabprevious<CR>

" Highlight the whole current line
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
