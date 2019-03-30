" Show the toolbar
set laststatus=2

" Configure the color scheme
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'] ]
      \ },
      \ }

" Remove the -- INSERT -- Bar, sicnce it is no needed
set noshowmode

if !has('gui_running')
  set t_Co=256
endif
