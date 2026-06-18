" ══════════════════════════════════════════════════════════════════════════════
" mg979/vim-visual-multi — Multiple cursors (VS Code Ctrl+D / Ctrl+Shift+L)
" Replaces the deprecated terryma/vim-multiple-cursors
" ══════════════════════════════════════════════════════════════════════════════

let g:VM_maps = {}

" Ctrl+D: select word under cursor / next occurrence (VS Code default)
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'

" Select all occurrences of word (VS Code Ctrl+Shift+L)
let g:VM_maps['Select All']         = '<leader>sa'

" Skip current occurrence (like VS Code's Skip)
let g:VM_maps['Skip Region']        = '<C-x>'

" Add cursor above / below
let g:VM_maps['Add Cursor Up']      = '<C-Up>'
let g:VM_maps['Add Cursor Down']    = '<C-Down>'

" Theme (inherits from colorscheme — no custom override needed)
let g:VM_theme = 'ocean'

" Show visual feedback
let g:VM_highlight_matches = 'hi! link VM_Mono DiffText'
