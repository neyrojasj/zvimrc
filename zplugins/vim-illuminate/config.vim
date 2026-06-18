" ══════════════════════════════════════════════════════════════════════════════
" RRethy/vim-illuminate — Highlight word under cursor (VS Code-like)
" ══════════════════════════════════════════════════════════════════════════════

" Delay before highlighting (ms)
let g:Illuminate_delay = 200

" Highlight the word under the cursor too
let g:Illuminate_highlightUnderCursor = 1

" Do not illuminate in these file types
let g:Illuminate_ftblacklist = ['NERDTree', 'startify', 'tagbar', 'help']

" Minimum word length to illuminate
let g:Illuminate_minWordLength = 2

" Navigate between highlighted references
nnoremap <silent> <A-n> <cmd>lua require"illuminate".next_reference{wrap=true}<cr>
nnoremap <silent> <A-p> <cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>
