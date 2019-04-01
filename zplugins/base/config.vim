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

" Enable the spell word checking
set spell

" Map the Ctrl + Shift + C to copy the selected text into the clipboard
map <F2> : w !pbcopy

" turn hybrid line numbers on
set number relativenumber
