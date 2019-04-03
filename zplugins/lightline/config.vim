" Show the toolbar
set laststatus=2

" Configure the color scheme
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified']]
      \ },
      \ 'component': {
      \   'girlfriend': 'My girlfriend is the best!'
      \ },
      \ }

" Remove the -- INSERT -- Bar, sicnce it is no needed
set noshowmode
