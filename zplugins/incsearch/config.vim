" Useful commands
" <Over>(incsearch-next)	to next match. default: <Tab>
" <Over>(incsearch-prev)	to prev match. default: <S-Tab>

" Map the vim search commands to the incremental search plugin

set hlsearch
let g:incsearch#auto_nohlsearch = 1

" Map the normal search commands
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Map the shortcut search commands
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
