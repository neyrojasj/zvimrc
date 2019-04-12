
" Map the / character to search files
map <Leader>/ :Files<CR>

" Map the b character to buffers files
map <Leader>. :Buffers<CR>

" Map the double leader to opened buffers
map <Leader><Leader> :History<CR>

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

" Set the hidden buffer mode, it allows leave opened buffers
" in background
set hidden

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
