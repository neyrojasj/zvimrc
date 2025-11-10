" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable tabline (top bar with buffers/tabs)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" Show buffer numbers in tabline
let g:airline#extensions#tabline#buffer_nr_show = 1

" Choose a theme (uncomment your favorite)
let g:airline_theme='gruvbox'
" let g:airline_theme='dracula'
" let g:airline_theme='onedark'
" let g:airline_theme='nord'
" let g:airline_theme='molokai'

" Custom symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

" Enable extensions
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1

" Show file encoding and format
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

